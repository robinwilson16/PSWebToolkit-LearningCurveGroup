<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="courseenrol.ascx.vb" Inherits="courseenrol"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

        <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->
    <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" />
  
<p><strong>Before you begin, please ensure you have the following information available in order to make a successful submission:</strong></p>

  <ul>
      <li>A passport size photo clearly identifying your face likeness</li>
      <li>Proof of identity, such as a copy of your passport, birth certificate or driving licence</li>
      <li>Copies of certificates for any qualifications you have already achieved</li>
      <li>Proof of residency in the UK/EE, if you have not been in the UK/EE for the past 3 continuous years</li>
 
  </ul>

<p><strong>Please note the following important information</strong></p>
<ul>
    <li><strong>This session will remain active for 30 minutes</strong> before it expires - you will have to start again if the session expires</li>
    <li>Remember to click the <strong>Submit button at the end of the form</strong>, otherwise we will not receive your enrolment</li>
    <li>Missing information including proof of identity, photo will delay or prevent your enrolment</li>
    <li>The  maximum file size is up to 2 MB per file, the supported file formats allowed are jpg, png, jpeg </li>
    <li>Your enrolment is subject to validation by the college submitting this form, does not guarantee you a place</li>
</ul>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Start " CssClass="button"  ImageResource="btnContinue" LinkResource="checkout_enrolments_aspx" CausesValidation="true" />


