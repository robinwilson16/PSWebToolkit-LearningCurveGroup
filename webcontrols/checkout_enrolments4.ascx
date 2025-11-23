<%@ control  Language="VB"  AutoEventWireup="false" CodeFile="checkout_enrolments4.ascx.vb" Inherits="checkout_enrolments4_Initial_IAG" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID=<%=CourseInformationID %>"><i class="fa-solid fa-scroll"></i> Course Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/courseenrol.ascx&OfferingID=<%=OfferingID %>"><i class="fa-solid fa-circle-info"></i> Information</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> Personal Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx"><i class="fa-solid fa-people-group"></i> Guardian / Emergency</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx"><i class="fa-solid fa-earth-americas"></i> Further Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_employment.ascx"><i class="fa-solid fa-city"></i> Employment</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx"><i class="fa-solid fa-award"></i> Qualifications</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments3.ascx"><i class="fa-solid fa-hourglass-start"></i> Course Dates</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-clipboard-check"></i> Initial IAG</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 80%">80%</div>
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"  />

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Initial IAG</h4>


      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined1" ID="txtCurrentQual" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Current experience and interests relevant to the course applied for"/>
          </div>
   </div>
<!--
       <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Does the applicants’ qualifications/experience meet the course entry requirements?</span>
             <asp:DropDownList ID="selectDropDownCourseEntryRequirement" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined3" ID="txtLearnDif" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Details of any learning difficulties, disabilities or long-term ill health which may affect study (include any additional support the student may require)"/>
          </div>
   </div>
-->
      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined4" ID="txtJobInterests" runat="server" Visible="true" LabelWidth="800" IsRequired="true"  CustomCaption="* The applicants job/career interests (where has the interest come from/any experience, how realistic/robust is the decision)"/>
          </div>
   </div>

<!--
      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined6" ID="txtSkillsAlready" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* What skills/strengths do you think you already have?"/>
          </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                    <span class="textfieldlabelrequired"></span>
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined7" ID="txtSkillsImprove" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Which skills do you think you need to improve?"/>
          </div>
   </div>

       <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Have you completed any aspect of this course previously? If yes, please provide details and copies of any relevant certificates</span>
             <asp:DropDownList ID="selectDropDownCompleted" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"   Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">In House</asp:ListItem>
             <asp:ListItem value="3">No</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined9" ID="txtCriminalPolice" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Criminal record/police involvement that might be relevant to the programme"/>
          </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined10" ID="txtOtherCourses" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* What other courses or areas of interest would you like to do in the future?"/>
          </div>
   </div>
-->
      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined11" ID="txtCompleteStudies" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Is there anything that your trainer needs to know that will help you complete your studies?"/>
          </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined12" ID="txtEnrolledOtherCourse" runat="server" Visible="false" LabelWidth="600" IsRequired="true"  CustomCaption="* Are you currently enrolled on any other course e.g. Flexible Learning, college programme or NVQ? If ‘yes’ please provide name of course and College or training provider"/>
          </div>
   </div>

       <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Have they completed year 11 at school (or will by start date) and doesn’t intend on returning to full time education or has left compulsory full time education?</span>
             <asp:DropDownList ID="selectDropDown1619Year11" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"   Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes - eligible</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

        <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Are they attending school or FE as a learner?</span>
             <asp:DropDownList ID="selectDropDown1619SchoolFE" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"   Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No - eligible</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

    <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Are they in HE, including holiday periods, and intends to return?</span>
             <asp:DropDownList ID="selectDropDown1619HE" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"   Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No - eligible</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

    <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Are they in custody or remand?</span>
             <asp:DropDownList ID="selectDropDown1619CustodyRemand" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"   Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No - eligible</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Free Course for Jobs Offer</h4>

       <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Is the learner applying for Free Course for Jobs?</span>
             <asp:DropDownList ID="selectDropDownNationalSkillsFund" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             <asp:ListItem value="3">N/A</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Staff Use Only</h4>

           <div class="row" id="divfundAvailable">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Is FCFJ funding available in the learners area?</span>
             <asp:DropDownList ID="selectDropDownOfferLevel3" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
                  </div>







               <div class="row" id="divNSFConfirm">
                                      <div class="col-sm-12 columns form-group"> Further to your enrolment, we have identified that you may be eligible to have this programme funded via the Free Course for Jobs rather than funding the programme via an advanced learner loan. Unfortunately Learning Curve Group does not have a Free Course for Jobs contract in your area. However, there may be other providers who have Free Courses for Jobs funding available for this programme.<br /><br /><strong>I confirm the following:</strong></div>
                   
                   <div class="col-sm-12 columns form-group"> 
                          1. Learning Curve Group have checked and advised that I am eligible to access funding for this course via
                            the Free Course for Jobs offer and have been referred to the National Careers Service to seek an
                            alternative provider with Free Course for Jobs funding for this programme:
           
             <asp:DropDownList ID="ddNSF1" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
             
                   <div class="col-sm-12 columns form-group"> 
                          2. I wish to undertake the programme with Learning Curve Group via an Advanced Learner Loan, and I am aware that this may mean I give up the right to exercise my entitlement to Free Course for Jobs funding in the future.
            
             <asp:DropDownList ID="ddNSF2" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>


  


</div>


<div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined58" ID="txtInductor" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Inductor (BDO/Student Services)"/>
         </div></div>

         <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined59" ID="txtIReferralSource" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Referral Source"/>
         </div></div>

         <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined57" ID="txtContract" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Contract"/>
         </div></div>

    <div class="row">
       <div class="col-sm-12 columns form-group">
       <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined17" ID="txtOfferingGroup" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Offering Group"/>
</div></div>

    </div>

    
       <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_enrolments3_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>


  
       <script type="text/javascript">
           $(document).ready(function () {

               $("#divNSFConfirm").hide();

               if ($("#<%=selectDropDownOfferLevel3.ClientID%>").val() == "2") {
                   $("#divNSFConfirm").show();
               }

               $("#divfundAvailable").hide();

               if ($("#<%= selectDropDownNationalSkillsFund.ClientID %>").val() == "1") {
                   $("#divfundAvailable").show();
               }

               $("#<%= selectDropDownNationalSkillsFund.ClientID %>").change(function () {
                   if ($("#<%= selectDropDownNationalSkillsFund.ClientID %>").val() == "1") {
                       $("#divfundAvailable").show();
                    }
                    else {
                       $("#divfundAvailable").hide();
                    }
                 
                });


               $('#<%= selectDropDownOfferLevel3.ClientID %>').change(function () {
                   if ($("#<%=selectDropDownOfferLevel3.ClientID%>").val() == "2") {
                       $("#divNSFConfirm").show();

                    }
                    else {
                       $("#divNSFConfirm").hide();
                    }
                 
                });
         });

       </script>