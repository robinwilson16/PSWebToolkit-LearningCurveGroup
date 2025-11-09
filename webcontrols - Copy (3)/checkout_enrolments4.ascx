<%@ control  Language="VB"  AutoEventWireup="false" CodeFile="checkout_enrolments4.ascx.vb" Inherits="checkout_enrolments4_Initial_IAG" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<!--<br />
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
                   <!-- <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li id="linkParent" runat="server" CausesValidation="true"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian - Emergency</a></li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="lnkQuals" runat="server" >Qualifications</li>
                    <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare"><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                </ol>
                       -->


<div class="progress" style="height: 20px;">
  <div class="progress-barlcg" role="progressbar" style="width: 87.5%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li>Further Details</li>
                    <li>Employment</li>
                    <li>Qualifications</li>
                    <li>Course Details</li>
                    <li><strong>Initial IAG</strong></li>
                    <li>Declarations</li>
                    </ol>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"  />
<div class="container">
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
          <h2>Initial IAG</h2>
          </div>
  </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined1" ID="txtCurrentQual" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Current qualifications/experience/interests relevant to course applied for:"/>
          </div>
   </div>

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

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined4" ID="txtJobInterests" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* The applicants’ job/career interests (where has the interest come from/any experience, how realistic/robust is the decision)"/>
          </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined5" ID="txtSkillsNecessary" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* What skills do you think are necessary to complete the programme? (e.g. Motivation, patience, confidence, honesty, reliability, sense of humour, presentation, taking responsibility, attendance, timekeeping, respect for others, decision making, communication, telephone, numerical, IT skills)"/>
          </div>
   </div>

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

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined11" ID="txtCompleteStudies" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Is there anything that your trainer needs to know that will help you complete your studies?"/>
          </div>
   </div>

      <div class="row">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined12" ID="txtEnrolledOtherCourse" runat="server" Visible="true" LabelWidth="600" IsRequired="true"  CustomCaption="* Are you currently enrolled on any other course e.g. Flexible Learning, college programme or NVQ? If ‘yes’ please provide name of course and College or training provider"/>
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

    <h4>National Skills Fund Level 3 Adult Offer</h4>

       <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Learning Curve Group have made me aware of the offer of a first full level 3 via the National Skills Fund and checked my eligibility for National Skills Fund?</span>
             <asp:DropDownList ID="selectDropDownOfferLevel3" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

       <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Is the learner eligible for National Skills Fund?</span>
             <asp:DropDownList ID="selectDropDownNationalSkillsFund" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes - proceed to complete the form</asp:ListItem>
             <asp:ListItem value="2">No - go straight to initial IAG section</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

</div>

      


 <cc1:CCCButton ID="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_enrolments3_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="checkout_dataprotection_aspx" CausesValidation="true" EnableEnterKey="true" />
<br />


    
   