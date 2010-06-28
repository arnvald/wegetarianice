//=======================================================================
// CommonUtils.js : Common utilities.
//
// Using:
//	Flexible Javascript Events by John Resig.
//	Clearing Default Text by Ross Shannon.
//
//	CUSTOM FORM ELEMENTS
//	http://ryanfait.com/resources/custom-checkboxes-and-radio-buttons/
//	Created by Ryan Fait
//	www.ryanfait.com
//
// Created by p3r, 2010.
//=======================================================================


//=======================================================================
// Globals.
//=======================================================================
var GCheckboxHeight = 16;
var GRadioHeight    = 16;


//=======================================================================
// Common untilities.
//=======================================================================
function AddEvent(InTargetObject, InType, InFunction)
{
	if(InTargetObject.addEventListener)
		InTargetObject.addEventListener(InType, InFunction, false);
	else if(InTargetObject.attachEvent)
	{
		InTargetObject["e" + InType + InFunction] = InFunction;
		InTargetObject[InType + InFunction] = function()
		{
			InTargetObject["e" + InType + InFunction](window.event);
		}
		InTargetObject.attachEvent( "on" + InType, InTargetObject[InType + InFunction] );
	}
}

function RemoveEvent(InTargetObject, InType, InFunction)
{
	if(InTargetObject.detachEvent)
	{
		InTargetObject.detachEvent( "on" + InType, InTargetObject[InType + InFunction] );
		InTargetObject[InType + InFunction] = null;
	}
	else
		InTargetObject.removeEventListener(InType, InFunction, false);
}


//=======================================================================
// Auto-clear input.
//=======================================================================
function InitAutoClearInput()
{
	var Inputs = document.getElementsByTagName("input");

	for(var i = 0; i < Inputs.length; ++i)
	{
		var Input = Inputs[i];

		if( ( Input.type == "text" || Input.type == "password" ) && Input.className.match(/AutoClear/) )
		{
			AddEvent(Input, "blur",  ReplaceDefaultInputText);
			AddEvent(Input, "focus", ClearDefaultInputText  );

			if(Input.value != "")
				Input.DefaultText = Input.value;
		}
	}
}

function ClearDefaultInputText(InEvent)
{
	var Target = window.event ? window.event.srcElement : InEvent ? InEvent.target : null;

	if(Target && Target.value == Target.DefaultText)
		Target.value = "";
}

function ReplaceDefaultInputText(InEvent)
{
	var Target = window.event ? window.event.srcElement : InEvent ? InEvent.target : null;

	if(Target && Target.value == "" && Target.DefaultText)
		Target.value = Target.DefaultText;
}


//=======================================================================
// Custom components.
//=======================================================================
function InitCustomComponents()
{
	var Inputs = document.getElementsByTagName("input");

	for(var i = 0; i < Inputs.length; ++i)
	{
		var Input = Inputs[i];

		if( (Input.type == "checkbox" || Input.type == "radio") && Input.className.match(/Custom/) )
		{
			var Div = document.createElement("div");
			Div.className = (Input.type == "checkbox") ? "CustomCheckBox" : "CustomRadio";

			if(Input.checked)
				Div.style.backgroundPosition = "0px -" + (Input.type == "checkbox" ? GCheckboxHeight : GRadioHeight) * 2 + "px";

			Input.parentNode.insertBefore(Div, Input);
			AddEvent(Input, "change", CustomComponentsClear);

			if( !Input.getAttribute("disabled") )
			{
				AddEvent(Div, "mousedown", CustomComponentsPushed);
				AddEvent(Div, "mouseup",   CustomComponentsCheck );
			}
			else
				Div.className += " CustomDisabledInput";
		}
	}

	Inputs = document.getElementsByTagName("select");

	for(var i = 0; i < Inputs.length; ++i)
	{
		var Input = Inputs[i];

		if( Input.className.match(/Custom/) )
		{
			Input.style.filter = "alpha(opacity = 0)";

			var Option   = Input.getElementsByTagName("option");
			var Active   = Option[0].childNodes[0].nodeValue;
			var TextNode = document.createTextNode(Active);

			for(var j = 0; j < Option.length; ++j)
				if(Option[j].selected)
					TextNode = document.createTextNode(Option[j].childNodes[0].nodeValue);

			var Div = document.createElement("div");
			Div.className = "CustomSelect";
			Div.id = "select" + Input.name;
			Div.appendChild(TextNode);
			Input.parentNode.insertBefore(Div, Input);

			if( !Input.getAttribute("disabled") )
				AddEvent(Input, "change", CustomComponentsChoose);
			else
				Input.previousSibling.className += " CustomDisabledInput";
		}
	}

	AddEvent(document, "mouseup", CustomComponentsClear);
}

function CustomComponentsPushed()
{
	var Element = this.nextSibling;

	if(Element.checked)
		this.style.backgroundPosition = "0px -" + (Element.type == "checkbox" ? GCheckboxHeight : GRadioHeight) * 3 + "px";
	else
		this.style.backgroundPosition = "0px -" + (Element.type == "checkbox" ? GCheckboxHeight : GRadioHeight) + "px";
}

function CustomComponentsCheck()
{
	var Element = this.nextSibling;

	if(Element.checked && Element.type == "checkbox")
	{
		this.style.backgroundPosition = "0px 0px";
		Element.checked = false;
	}
	else
	{
		if(Element.type == "checkbox")
			this.style.backgroundPosition = "0px -" + GCheckboxHeight * 2 + "px";
		else
		{
			this.style.backgroundPosition = "0px -" + GRadioHeight * 2 + "px";
			var Group  = this.nextSibling.name;
			var Inputs = document.getElementsByTagName("input");

			for(var i = 0; i < Inputs.length; ++i)
				if(Inputs[i].name == Group && Inputs[i] != this.nextSibling)
					Inputs[i].previousSibling.style.backgroundPosition = "0px 0px";
		}

		Element.checked = true;
	}
}

function CustomComponentsClear()
{
	var Inputs = document.getElementsByTagName("input");

	for(var i = 0; i < Inputs.length; ++i)
	{
		var Input = Inputs[i];

		if( (Input.type == "checkbox" || Input.type == "radio") && Input.className.match(/Custom/) )
		{
			if(Input.checked)
				Input.previousSibling.style.backgroundPosition = "0px -" + (Input.type == "checkbox" ? GCheckboxHeight : GRadioHeight) * 2 + "px";
			else
				Input.previousSibling.style.backgroundPosition = "0px 0px";
		}
	}
}

function CustomComponentsChoose()
{
	var Option = this.getElementsByTagName("option");

	for(var i = 0; i < Option.length; ++i)
		if(Option[i].selected)
			document.getElementById("select" + this.name).childNodes[0].nodeValue = Option[i].childNodes[0].nodeValue;
}


//=======================================================================
// Startup events.
//=======================================================================
AddEvent(window, "load", InitAutoClearInput  );
AddEvent(window, "load", InitCustomComponents);
