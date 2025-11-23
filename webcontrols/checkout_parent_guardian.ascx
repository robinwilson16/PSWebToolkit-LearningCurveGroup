<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_parent_guardian.ascx.vb" Inherits="webcontrols_checkout_parent_guardian" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

</script>
<!--
<br />
<div class="container">
   <div class="row">
      <div class="col-sm-12 columns form-group"> 
                <asp:Label runat="server" ID="lblAge"></asp:Label>
          </div>   

   </div>
       <div class="row">
         
       <div class="col-sm-12 columns form-group"> 
<asp:Label runat="server" ID="lblAgeCourse"></asp:Label>
          </div>
       </div>
    </div>
<br />
    -->
<!--
      <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li>Guardian - Emergency</li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="lnkQuals" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare"><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                </ol>
    -->

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID=<%=CourseInformationID %>"><i class="fa-solid fa-scroll"></i> Course Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/courseenrol.ascx&OfferingID=<%=OfferingID %>"><i class="fa-solid fa-circle-info"></i> Information</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> Personal Details</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-people-group"></i> Guardian / Emergency</li>
        </ol>
    </div>
</nav>


<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 30%">30%</div>
</div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3" id="parent1panel" runat="server">
    <h4><i class="fa-solid fa-square-caret-right"></i> Parent / Guardian</h4>

  <div class="row">
      <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="contact1" ID="fldParentFirstName" runat="server" IsRequired="true" CustomCaption="* Name"/>
          </div>
   </div>
          <div class="row">
        <div class="col-sm-12 columns form-group"> 
                       <p><strong>You must provide at least one phone number below:</strong></p>
            </div>
       </div>
    <div class="row">
    <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1MobileTel" ID="StudentEmailField1" runat="server" IsRequired="false" CustomCaption="* Mobile Number" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
    <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900">
Hover over me for Mobile format
</button>   
        </div>
       <div class="col-sm-6 columns form-group">
                   <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="StudentEnrolmentField10" runat="server" CustomCaption="* Home Tel Number" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
       <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900">
Hover over me for Telephone format
</button> 
    </div>
     </div>
     <div class="row">
        <div class="col-sm-12 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1EmailAddress" CustomCaption="Email" ID="StudentEnrolmentField11" runat="server"  LabelWidth="200" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"/>
        </div>
     </div>
   
       <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="* Relationship to you" ExcludedIDValues ="1,3,6,8,10,14" />
    </div>
    </div>
    


<div class="container" id="parent2panel" runat="server">
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <h2>Emergency contacts in case of accident or illness</h2>
          <p>Applies to all students - the Training Provider has a legitimate interest in ensuring the health and safety of all our students. The details of your emergency contact are detailed here.  The named person(s) will only be contacted for emergency purposes in the immediate health or safety interests of you as a student.  You must keep these details up to date and you must inform the individual(s) that you have disclosed their details to Training Provider.   </p>
    
          </div>
  </div>

     <div class="row">
        <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2" ID="StudentEnrolmentField9" runat="server" IsRequired="true"  CustomCaption="* Name"/>
        </div>
    </div>
              <div class="row">
        <div class="col-sm-12 columns form-group"> 
                       <p><strong>You must provide at least one phone number below:</strong></p>
            </div>
       </div>
     <div class="row">
  <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2MobileTel" ID="StudentEnrolmentField2" runat="server" LabelWidth="200" IsRequired="false"  CustomCaption="* Mobile" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
      <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900">
Hover over me for Mobile format
</button>    </div>
        <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Tel" ID="StudentEnrolmentField14" runat="server" LabelWidth="200" IsRequired="false"  CustomCaption="* Home Telephone" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" />
       <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900">
Hover over me for Telephone format
</button> 
            </div>
         </div> 
         <div class="row">
        <div class="col-sm-12 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2EmailAddress" CustomCaption="Email" ID="StudentEnrolmentField1" runat="server"  LabelWidth="200" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"/>
        </div>
     </div>

     <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2RelationshipID" ID="StudentEnrolmentField16" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="* Relationship to you" ExcludedIDValues ="1,2,3,6,8,14" />
    </div>
     
    <p>The named person(s) will only be contacted for emergency purposes in the immediate health or safety interests of you as a student.  You must keep these details up to date and you must inform the individual(s) that you have disclosed their details to the training provider.</p>
</div>


<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_enrolments_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_enrolments2_aspx" />
            </span>
        </div>
    </div>
</div>