<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="checkout_dataprotection.ascx.vb" Inherits="checkout_dataprotection"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>
      <!--          <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li id="linkParent" runat="server" CausesValidation="true"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian / Emergency</a></li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="lnkQuals" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare">Declarations</li>
                </ol>
          -->

<script>

                 $(function () {
                     $('[data-toggle="tooltip"]').tooltip()
                 })

          </script>
<div class="progress" style="height: 20px;">
  <div class="progress-barlcg" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li>Further Details</li>
                     <li>Employment</li>
                    <li>Qualifications</li>
                       <li>Course Details</li>
                     <li><strong>Declarations</strong></li>
                    </ol>
  
    
<div class="container">

  <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <h2>Data Protection Privacy Statements</h2>
          </div>
  </div>
  <div class="row">
      <div class="col-sm-12 columns form-group"> 
            <p><strong>How We Use Your Personal Information - ESFA</strong> - This privacy notice is issued by the Education and Skills Funding Agency (ESFA) on behalf of the Secretary of State for the
Department of Education (DfE) to inform learners about the Individualised Learner Record (ILR) and how their personal information
is used in the ILR. Your personal information is used by the DfE to exercise our functions under article 6(1)(e) of the UK GDPR and
to meet our statutory responsibilities, including under the Apprenticeships, Skills, Children and Learning Act 2009.</p>
          <p>The ILR collects data about learners and learning undertaken. Publicly funded colleges, training organisations, local authorities,
and employers (FE providers) must collect and return the data to the ESFA each year under the terms of a funding agreement,
contract or grant agreement. It helps ensure that public money distributed through the ESFA is being spent in line with government
targets. It is also used for education, training, employment, and well being purposes, including research. We retain ILR learner
data for 3 years for operational purposes and 66 years for research purposes. For more information about the ILR and the data
collected, please see the ILR specification at <a href="https://www.gov.uk/government/collections/individualised-learner-record-ilr" target="_blank">https://www.gov.uk/government/collections/individualised-learner-record-ilr</a></p>
          <p>ILR data is shared with third parties where it complies with DfE data sharing procedures and where the law allows it. The DfE and
the English European Social Fund (ESF) Managing Authority (or agents acting on their behalf) may contact learners to carry out
research and evaluation to inform the effectiveness of training. In these cases, it is part of our statutory duties and we do not need
your consent.</p>
          </div>
   </div>
    <p>Where sharing is not part of our statutory duties, you can give your consent to be contacted by other third parties about:</p>
    <div class="row">
        <div class="col-sm-6 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RestrictedUseAllowResearch" ID="StudentEnrolmentField18" runat="server" IsRequired="false" LabelWidth="400"  CustomCaption="Tick if you want to be contacted in respect to surveys and research"/>
            </div>
        <div class="col-sm-6 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RestrictedUseAllowLearningOpportunities" ID="StudentEnrolmentField15" runat="server" IsRequired="false" LabelWidth="430"  CustomCaption="Tick if you want to be contacted about courses or learning opportunities"/>
            </div>
    </div><p>How do you prefer to be contacted?</p>
    <div class="row">
        <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RestrictedUseAllowContactByEmail" ID="StudentEnrolmentField12" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="by Email" />
            </div>
        <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RestrictedUseAllowContactByPost" ID="StudentEnrolmentField13" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="by Post"  />
            </div>
        <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RestrictedUseAllowContactByTelephone" ID="StudentEnrolmentField14" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="by Telephone"  />
            </div>

    </div>
     <div class="row">
      <div class="col-sm-12 columns form-group"> 
           <p>For more information about how your personal data is used and your individual rights, please see the DfE Personal Information
Charter (<a href="https://www.gov.uk/government/organisations/department-for-education/about/personal-information-charter" target="_blank">https://www.gov.uk/government/organisations/department-for-education/about/personal-information-charter</a>) and the
ESFA Privacy Notice (<a href="https://www.gov.uk/government/publications/esfa-privacy-notice" target="_blank">https://www.gov.uk/government/publications/esfa-privacy-notice</a>)
If you would like to get in touch with us, you can contact the DfE in the following ways:</P>
               <ul>
                   <li>Using our online contact form at <a href="https://form.education.gov.uk/service/Contact_the_Department_for_Education" target="_blank">https://form.education.gov.uk/service/Contact_the_Department_for_Education</a></li>
                   <li>By telephoning the DfE Helpline on 0370 000 2288</li>
                   <li>Or in writing to – Data Protection Officer, Ministerial and Public Communications Division, Department for Education, Piccadilly
Gate, Store Street, Manchester, M1 2WD</li>
               </ul>

    <p>
If you are unhappy with how we have used your personal data, you can complain to the Information Commissioner’s Office (ICO) at – Wycliffe House, Water Lane, Wilmslow, Cheshire, SK9 5AF. You can also call their helpline on 0303 123 1113 or visit <a href="https://www.ico.org.uk" target="_blank">https://www.ico.org.uk</a>

    </p> </div>
        </div>
</div>

  <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <h2>How We Use Your Personal Information - Learning Curve Group</h2>
          </div>
 </div>
<div class="row">
 <div class="col-sm-12 columns form-group">
     <p>Learning Curve Group take your privacy very seriously. When we use your personal data we are regulated
under the General Data Protection Regulation (GDPR) which applies across the European Union (including
in the United Kingdom) and we are responsible as ‘controller’ of that personal data for the purposes of the
GDPR. Our use of your personal data is subject to us offering our services to you, your consent, the GDPR, and
other relevant UK and EU legislation.</p>
     <strong>Personal Data we Collect</strong>
     <p>We will collect personal information including name, address, contact details, identification, national
insurance number, nationality and immigration status, spouse/partner/dependents, employment status and
emergency contact information. We may also collect other personal data as and when required for contractual
requirements.</p>
     
     <strong>How and why we use Your Personal Data</strong>
     <p>Under data protection law, we can only use your personal data if we have a proper reason for doing so, e.g.:</p>
     <ul>
         <li>For the performance of our contract with you or to take steps at your request before entering into a
contract</li>
         <li>To comply with our legal and regulatory obligations</li>
         <li>For our legitimate interests or those of a third party</li>
         <li>Where you have given consent</li>

     </ul>
     <p>
         A legitimate interest is when we have a business or commercial reason to use your information, so long as
this is not overridden by your own rights and interests.<br />
Further information about use of and access to your personal data, how it is collected and shared and what
we use your personal data for can be found on our website at <a href="https://www.learningcurvegroup.co.uk/privacy" target="_blank">www.learningcurvegroup.co.uk/privacy</a>

     </p>
     <strong>Marketing Consent</strong>
     <p>Although we may contact you to provide progress updates, we may also use your personal data to send you
information (by email, text message, telephone or post) about our services, new courses and new services. If
you would like to know more about new courses and progression opportunities, please confirm below:</p>
       <div class="row">
        <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CanBeContactBySMS" ID="StudentEnrolmentField2" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="by SMS" />
            </div>
        <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="GDPRAllowContactByEmail" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="by Email"  />
            </div>
        <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="GDPRAllowContactByPhone" ID="StudentEnrolmentField4" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="by Telephone"  />
            </div>
             <div class="col-sm-2 columns form-group"> <cc1:StudentEnrolmentField StudentEnrolmentFieldType="GDPRAllowContactByPost" ID="StudentEnrolmentField5" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="by Post"  />
            </div>
    </div>

     <p>You have the right to opt out of receiving promotional communications at any time by:</p>
     <ul>
         <li>Contacting us by emailing <a href="mailto:unsubscribe@learningcurvegroup.co.uk">unsubscribe@learningcurvegroup.co.uk</a></li>
         <li>Using the ‘unsubscribe’ link in emails or ‘STOP’ number in texts</li>
     </ul>
     </div>

    </div>

<div class="panel panel-info">
    <div class="panel-heading" id="dec">Declaration</div>
    <h3>Please take time to read through this declaration before proceeding</h3>

      <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->

    <p><strong>I confirm that</strong> to the best of my knowledge, the information given in this form is correct and complete. I agree
to Learning Curve Group processing the information in accordance with Data Protection legislation and I will
inform Learning Curve Group if any of the details identified in the above, change in any way. I have received
appropriate information, advice and guidance about my chosen course(s), entry requirements, content,
assessment, suitability and support.</p>
   
    <p><strong>I confirm that</strong> all of the personal information on this form is correct. I declare I have correctly identified my
prior qualifications. I am aware of the fees and charges relating to the programme (where applicable), and I
understand that if I have declared false information, action may be taken against me to reclaim tuition fees
and any associated costs.</p>

<p>By signing this form, I agree to abide by Learning Curve Group Policies and Procedures. Learning Curve Group
includes Learning Curve (10008935), Profound Services (10022358), Northern Care Training (10013515) and
London Hairdressing Apprenticeship Academy (10035171), Acorn Training Consultants (10000108), Antrec Ltd (10043333) and MPCT (10000311).
    </p>
    <br />
  
   
    <p> <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="- I confirm that I have read the declaration above" Font-Bold="True" 
            CausesValidation="True" />
    </p>
      <uc1:StudentSignature runat="server" ID="StudentSignature" />
</div>


        <cc1:CCCButton ID="btnBack" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_enrolments3_aspx"/>
          <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnSubmit" CausesValidation="true" Visible="false"/>



<div  class="container">
    <div class="row">
        <div class="col-sm-3 columns form-group">  
            <button id="mybutton" class="btn btn-lg btn-primary" type="button"    runat="server" causesvalidation="true" onserverclick="btnContinue_Click">
             <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
               Submit your details
                </button>
         <div  id="divSaver" style="display:none">
             <button id="Button1" class="btn btn-lg btn-secondary" type="button" >
             <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
               Saving your details....please wait.....
                </button>
             </div>
            </div>
       <div class="col-sm-6 columns form-group">  </div>
      </div>
  </div>
   
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

 <script type="text/javascript">  
  //   alert(($('#<%= chkConfirm.ClientID %>').is(':checked')))
  
     $('.btn-lg').on('click', function () {

         if ($(this).hasClass('disabled')) {
             return false;
         } else {
             $(this).addClass('disabled');
             $('#divSaver').show();
             return true;
         }
     });
 </script>

  