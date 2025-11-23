<%@ control  Language="VB"  AutoEventWireup="false" CodeFile="checkout_quals_on_entry.ascx.vb" Inherits="checkout_quals_on_entry" %>
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

<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>

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
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-award"></i> Qualifications</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 60%">60%</div>
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"  />

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Current Courses and Highest Qualifications</h4>

      <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudyElsewhere" ID="fldStudyElse" runat="server" Visible="true" LabelWidth="350" IsRequired="false"  CustomCaption="Are you currently enrolled on another funded course?"/>
          </div>
   </div>

       <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined60" ID="txtAnotherFundedCourse" runat="server" Visible="true" LabelWidth="350" IsRequired="false"  CustomCaption="If ticked, please provide details including days and times of attendance:"/>
          </div>
   </div>

         <%--<div class="row">
         <div class="col-sm-12 columns form-group">
              <p>Has learner been excluded from learning prior to LCG?</p>
              <asp:CheckBox runat="server" ID="chkPrevExcluded">
              </asp:CheckBox>
          </div>
        </div>--%>

        <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Has learner been excluded from learning prior to LCG?</span>
             <asp:DropDownList ID="selectDropDownLearnerExcluded" runat="server" CssClass="textfield form-control" Visible="true" LabelWidth="600" IsRequired="true"  Width="265" >
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="Yes">Yes</asp:ListItem>
             <asp:ListItem value="No">No</asp:ListItem>
             </asp:DropDownList>
                </div>
   </div>

    <div class="row">
          <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentFirstLanguageID" ID="fldLanguage" runat="server" IsRequired="false" CustomCaption="* If English is not your first language, please select" LabelWidth="350"/>
          </div>

    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:studentenrolmentfield id="fldPriorAttainmentLevelID" runat="server" customcaption="* Please indicate your highest qualification to date?" ExcludedIDValues="98" isrequired="true" labelwidth="350" StudentEnrolmentFieldType="PriorAttainmentLevelID"></cc1:studentenrolmentfield>
        <span id="showItem"><a class="btn btn-primary" role="button">Unsure? Click me to help you decide</a></span>
            </div>
    </div>  
      
</div>


<div id="priorDiv">
  
<table class="table table-striped table-bordered">
    <tr class="active"><th>Level</th><th>Qualification Equivalent<div style="float:right" ><span id="hideItem"><a class="btn btn-secondary" role="button">Hide table</a></span></div></th></tr>
    <tr><td>
        Entry Level</td><td>
            QCF qualifcations at Entry level; Certificate in Adult Literacy, Numeracy, ESOL at Entry level; RQF qualifications at Entry Level; English and Maths qualifications at Entry Level such as Functional Skills</td>
        </tr>
        <tr>
            <td>
                Level 1</td>
            <td>
                GCSE/O Level (at grades D-G or fewer than 5 at grades A-C); CSE grade 2 and 3; 1 AS Level (for AS qualifications regulated before 1 September 2015); QCF qualifications at Level 1; Foundation 14-19 Diploma; Functional Skills; Certificate in Adult Literacy, Numeracy, ESOL at Level 1; Level 1 Key Skills; Level 1 Principal Learning; Introductory Diploma; Introductory Certificate; GNVQ Foundatio;n NVQ Level 1; RQF qualifications at Level 1; Technical Awards in the Key Stage 4 Performance Tables</td>
           
        </tr>
        <tr>
            <td>
                Level 2</td>
            <td>
               Vocational and technical qualifications at level 2 (not on the level 2 and level 3 legal entitlement list); Functional skills at level 2; ESOL (skills for life); Technical Awards in the Key Stage 4 Performance Tables; Performing Arts Graded Examination qualifications
            </td>
        </tr>
        <tr>
            <td>
                Full Level 2</td>
            <td>
                GCSE/O Level (5 or more GCSEs grades A*-C); GCSE (9-1) (5 or more GCSEs grade 4 or above); 2 or 3 AS Levels (for AS qualifications regulated before 1 September 2015); CSE Grade 1 (5 or more); 1 A Level; Higher 14-19 Diploma; QCF Diploma level 2; QCF Certificate level 2 at 13 or 14 credits undertaken before 2014 to 2015; Level 2 Principal Learning; NVQ level 2; GNVQ Intermediate; Technical Certificates in the 16-19 Performance Tables; QCF Certificate level 2 at 15 credits and above; From 1 August 2015 vocational qualifications of 150 GLH or more that are on the level 2 and level 3 legal entitlement qualification list.  
            </td>
        </tr>
        <tr>
            <td>
                Level 3</td>
            <td>
                Vocational and technical qualifications at level 3 (not on the level 2 and level 3 legal entitlement list); Core maths; Technical qualifications (part of T levels); Components of international baccalaureate; Performing Arts Graded Examination qualifications; Pre U qualifications
            </td>
        </tr>
        <tr>
            <td>
                Full Level 3</td>
            <td>
                A Levels (2 or more advanced level passes); 4 or more AS Levels (for AS qualifications regulated before 1 September 2015); QCF Diploma Level 3; QAA Access to HE; Advanced 14-19 Diploma; GNVQ Advanced; NVQ level 3; AVCE double award; Tech Levels which are in the 16-19 Performance Tables; Applied Generals which are in the 16-19 Performance Tables (from 1 August 2015); QCF Certificate at Level 3 which is 30 to 36 credits; From 1 August 2015 vocational qualifications of 300 GLH or more that are on the level 2 and level 3 legal entitlement qualification list. 
            </td>
        </tr>
        <tr>
            <td>
                Level 4</td>
            
            <td>
               QCF Award Level 4; QCF Certificate Level 4; QCF Diploma Level 4; HNC; RQF qualification Level 4; Certificates in Higher Education
        </tr>
        <tr>
            <td>
                Level 5</td>
            
            <td>QCF Award Level 5; QCF Certificate Level 5; QCF Diploma Level 5; HND; RQF qualification Level 5; Foundation Degrees
                </td>
        </tr>
        <tr>
            <td>
                Level 6</td>
            
            <td>QCF Award Level 6; QCF Certificate Level 6; QCF Diploma Level 6; RQF qualification Level 6; Bachelor’s degrees; graduate certificates and diplomas
                </td>
        </tr>
        <tr>
            <td>
                Level 7+</td>
            
            <td>QCF Award Level 7/8; QCF Certificate Level 7/8; QCF Diploma Level 7/8; RQF qualification Level 7/8; Doctorates; Masters degree; postgraduate ceritifcates and diplomas
                </td>
        </tr>

    <tr><td colspan="3"><span id="hideItem2"><a class="btn btn-secondary" role="button">Hide table</a></span></td></tr>
    </table>
</div>


<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3" id="divYourQuals" runat="server">
    <h4><i class="fa-solid fa-square-caret-right"></i> Your Qualifications</h4>
   
   <p>If you have not yet taken your exams or recevied your results, please provide us with your predicted grades. 
                Please include information on all qualifications. ie GCSE, NVQs, BTEC, Diplomas, A levels or any other subjects you may have studied. </p> 
                <p>
                Please enter the qualifications, choosing from the drop-down lists below.</p>
    <!--
    <asp:button runat="server" id="btnNoPriorQualifications" cssClass="show_hide btn btn-primary" text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
    <br />
    -->
     <div id="slidingdiv" class="slidingDiv" runat="server">
        <asp:table class="table table-striped text-center" id="tblQuals" runat="server">
        <%--<tr><th>Qualification</th><th>Subject (if not in list)</th><th>Predicted Grade</th><th>Grade</th><th>Date Awarded</th></tr>--%>

        </asp:table>
    <asp:button runat="server" id="btnAdd" cssClass="btn btn-success" text="Add Row" CausesValidation="false"></asp:button>

        </div>
  </div>


<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3" id="div1" runat="server">
    <h4><i class="fa-solid fa-square-caret-right"></i> Conditionality Check for English and Maths</h4>

    <p>Do you have functional skills L2 in English or an alternative English qualification:</p>

  <div class="row">
      <div class="col-sm-4 columns form-group"> 
           <cc1:StudentEnrolmentField id="fldGCSEEngCoF" runat="server" customcaption="* GCSE English CoF" CustomFieldType="Lookup" labelwidth="300" StudentEnrolmentFieldType="StudentDetailUserDefined46"></cc1:StudentEnrolmentField>
          </div>
       <div class="col-sm-4 columns form-group"> 
           <cc1:StudentEnrolmentField id="fldGCSEEngGrade" runat="server" customcaption="* GCSE English Grade" CustomFieldType="Lookup"  labelwidth="300" StudentEnrolmentFieldType="StudentDetailUserDefined47"></cc1:StudentEnrolmentField>
          </div>
             <div class="col-sm-4 columns form-group"> 
           <cc1:StudentEnrolmentField id="StudentEnrolmentField2" runat="server" customcaption="* GCSEs atttained by Yr11"   labelwidth="300" StudentEnrolmentFieldType="AchievedEnglishGCSEByEndOfYear11"></cc1:StudentEnrolmentField>
          </div>
   </div>

    <p>Do you have functional skills L2 in Maths or an alternative Maths qualification:</p>

  <div class="row">
      <div class="col-sm-4 columns form-group"> 
           <cc1:StudentEnrolmentField id="fldGCSEMathCoF" runat="server" customcaption="* GCSE Maths CoF" CustomFieldType="Lookup" labelwidth="300" StudentEnrolmentFieldType="StudentDetailUserDefined48"></cc1:StudentEnrolmentField>
          </div>
       <div class="col-sm-4 columns form-group"> 
           <cc1:StudentEnrolmentField id="fldGCSEMathGrade" runat="server" customcaption="* GCSE Maths Grade" CustomFieldType="Lookup"  labelwidth="300" StudentEnrolmentFieldType="StudentDetailUserDefined49"></cc1:StudentEnrolmentField>
          </div>
             <div class="col-sm-4 columns form-group"> 
           <cc1:StudentEnrolmentField id="StudentEnrolmentField1" runat="server" customcaption="* GCSEs atttained by Yr11"   labelwidth="300" StudentEnrolmentFieldType="AchievedMathsGCSEByEndOfYear11"></cc1:StudentEnrolmentField>
          </div>
   </div>

</div>


<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_employment_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_enrolments3_aspx" />
            </span>
        </div>
    </div>
</div>
    
   
        <asp:HiddenField  id="NoQuals" value="false" runat="server"  ClientIDMode="static" />
     <asp:HiddenField  id="intQualRows" value="0" runat="server"  ClientIDMode="static" />
 <script type="text/javascript">
        var divToHide = $('div#priorDiv');
     var hideBtn = $('span#hideItem');
             var hideBtn2 = $('span#hideItem2');
        var showBtn = $('span#showItem');

        showBtn.click(function () {
            divToHide.show();
        });

        hideBtn.click(function () {
            divToHide.hide();
     });

             hideBtn2.click(function () {
            divToHide.hide();
        });

        $(document).ready(function () {
            //alert();
            divToHide.hide();
   <%--          $("#divYourQuals").hide();
           $('#<%= fldPriorAttainmentLevelID.ClientID %>').change(function () {
                if ($("#<%=fldPriorAttainmentLevelID.ClientID%>").val() == "99") {
                    $("#divYourQuals").hide();
                    return;
                }
                else {
                   $("#divYourQuals").show();
                }
            });--%>

        });

        
    </script>