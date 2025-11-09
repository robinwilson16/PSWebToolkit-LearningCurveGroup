<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="checkout_dataprotection.ascx.vb" Inherits="checkout_dataprotection"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

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
                    <li>Initial IAG</li>
                    <li><strong>Declarations</strong></li>
                    </ol>
  
    
<div class="container">

  <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <h2>Data Protection Privacy Statements</h2>
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
</div>

  
    
<div class="panel panel-info">
    <div class="panel-heading" id="dec">Declaration</div>

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

<p>By signing this form, I agree to abide by Learning Curve Group Policies and Procedures. Learning Curve Group includes Learning Curve (10008935), Profound Services (10022358), Northern Care Training (10013515), London Hairdressing Apprenticeship Academy (10035171), Acorn Training Consultants (10000108), Antrec Ltd (10043333), White Rose (10007484) and MPCT (10000311)
    </p>
    <br />
  
   <%--<asp:Label ID="SalesForceInfo" runat="server" />--%>

    <p> <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="- I confirm that I have read the declaration above" Font-Bold="True" 
            CausesValidation="True" />
    </p>

</div>


        <cc1:CCCButton ID="btnBack" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_enrolments4_aspx"/>
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

  