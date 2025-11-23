<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="courseenrol.ascx.vb" Inherits="courseenrol"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID=<%=CourseInformationID %>"><i class="fa-solid fa-scroll"></i> Course Details</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-circle-info"></i> Information</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 15%">15%</div>
</div>

        <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->
    <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" />
 
<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Information You Will Require</h4>

<p><strong>Before you begin, please ensure you have the following information available in order to make a successful submission:</strong></p>

  <ul class="list-group">
      <li class="list-group-item"><i class="fa-solid fa-check"></i> A passport size photo clearly identifying your face likeness</li>
      <li class="list-group-item"><i class="fa-solid fa-check"></i> Proof of identity, such as a copy of your passport, birth certificate or driving licence</li>
      <li class="list-group-item"><i class="fa-solid fa-check"></i> Copies of certificates for any qualifications you have already achieved</li>
      <li class="list-group-item"><i class="fa-solid fa-check"></i> Proof of residency in the UK/EE, if you have not been in the UK/EE for the past 3 continuous years</li>
 
  </ul>
</div>

<div class="alert alert-primary" role="alert">
    <div class="row">
        <div class="col-md-auto d-flex align-items-center">
            <h1><i class="fa-solid fa-circle-info"></i></h1>
        </div>
        <div class="col-md">
            <p><strong>Please note the following important information</strong></p>
            <ul>
                <li><strong>This session will remain active for 30 minutes</strong> before it expires - you will have to start again if the session expires</li>
                <li>Remember to click the <strong>Submit button at the end of the form</strong>, otherwise we will not receive your enrolment</li>
                <li>Missing information including proof of identity, photo will delay or prevent your enrolment</li>
                <li>The  maximum file size is up to 2 MB per file, the supported file formats allowed are jpg, png, jpeg </li>
                <li>Your enrolment is subject to validation by the college submitting this form, does not guarantee you a place</li>
            </ul>
        </div>
    </div>
</div>


      
<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_enrolments_aspx" />
            </span>
        </div>
    </div>
</div>