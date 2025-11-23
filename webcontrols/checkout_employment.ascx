<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_employment.ascx.vb" Inherits="webcontrols_checkout_employment" %>
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
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-city"></i> Employment</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 50%">50%</div>
</div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    
       <script type="text/javascript">
         $(document).ready(function () {

            $("#divpay").hide();
            $("#divloan").hide();             
            $("#divEmp").hide();
           $("#divEmployerName").hide(); 
           $("#divEmployerDet1").hide();
           $("#divUCQuestions").hide();
           
       
         if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                     $("#divEmploymentLength").show();
                     $("#divEmploymentIntensity").show();
                    //    $("#divEmployerName").show(); 
                    //     $("#divEmployerDet1").show();
             if ($("#<%=selectBenefits.ClientID%>").val() == "04" || $("#<%=selectBenefits.ClientID%>").val() == "06") {
                 $("#divUCQuestions").show();
                 //alert('b');
               
             }
             else {
                 $("#divUCQuestions").hide();
             }
                 }
                 else if (($("#<%=selectEmployed.ClientID%>").val() == "11") || $("#<%=selectEmployed.ClientID%>").val() == "12") {
                $("#divUnEmploymentLength").show();
             }
             $('#<%= selectEmployed.ClientID %>').change(function () {
                 $("#divEmploymentLength").hide();
                 $("#divEmploymentIntensity").hide();
                 $("#divEmployerName").hide();
                 $("#divUnEmploymentLength").hide();
                 $("#divUCQuestions").hide();
                //   $("#divEmployerDet1").hide();
                 $("#<%=selectEmploymentLength.ClientID%>").val("")
                 $("#<%=selectEmploymentIntensity.ClientID%>").val("")
                 $("#<%=selectLengthUnemployed.ClientID%>").val("")
                 $("#<%=selectDropDownTakeHomePay.ClientID%>").val("")
                 $("#<%=selectDropDownUniversalCredit.ClientID%>").val("")
                 $('#ctl00_MainContentPlaceholder_ctl00_txtGrossSalary_txtStudentDetailUserDefined54').val("£0")
                 $("#<%=selectBenefits.ClientID%>").val("")
                 if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                     $("#divEmploymentLength").show();
                     $("#divEmploymentIntensity").show();
                        $("#divEmployerName").show();
                 //    $("#divEmployerDet1").show();
                     return;
                 }
                 else if (($("#<%=selectEmployed.ClientID%>").val() == "11") || $("#<%=selectEmployed.ClientID%>").val() == "12") {
                     $("#divUnEmploymentLength").show();
                     return;
                 }
             });

           //  $("#divBeneifts").hide();
             if ($("#<%=selectBenefits.ClientID%>").val() != "") {
                 $("#divBeneifts").show();
             }
             

             $('#<%= selectBenefits.ClientID %>').change(function () {
                 if ($("#<%=selectBenefits.ClientID%>").val() != "") {
                     $("#divBeneifts").show();

                 }
                 else {
                     $("#divBeneifts").hide();
                 }
                 //alert($("#<%=selectBenefits.ClientID%>").val());
                 if (($("#<%=selectEmployed.ClientID%>").val() == "10") && ($("#<%=selectBenefits.ClientID%>").val() == "04" || $("#<%=selectBenefits.ClientID%>").val() == "06")) {
                     $("#divUCQuestions").show();
                     //alert('b');
                 }
                 else if (($("#<%=selectEmployed.ClientID%>").val() == "11") && ($("#<%=selectBenefits.ClientID%>").val() == "04" || $("#<%=selectBenefits.ClientID%>").val() == "06")) {
                     $("#divUCQuestions").show();
                     //alert('b');
                 }
                 else if (($("#<%=selectEmployed.ClientID%>").val() == "12") && ($("#<%=selectBenefits.ClientID%>").val() == "04" || $("#<%=selectBenefits.ClientID%>").val() == "06")) {
                     $("#divUCQuestions").show();
                     //alert('b');
                 }
                 else {
                     $("#divUCQuestions").hide();
                 }
             });

         });
 
       </script>

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Employment Status</h4>

            <div class="row">
                <div class="col-sm-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="nino" runat="server"  IsRequired="false" width="410" CustomCaption="NI Number"  Pattern="^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$"/>
     <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the number is two prefix letters, six digits and one suffix letter. Use UPPER CASE for letters.  An example is QQ123456C. Neither of the first two letters can be D, F, I, Q, U or V. The second letter also cannot be O. The prefixes BG, GB, NK, KN, TN, NT and ZZ are not allowed">
                Hover over me for NI format
</button>
          </div>
        </div>

      <div class="row">

         <%-- Example of field pulled from cc1:StudentEmploymentHistory (Auto Maps to ProSol field) --%>

  <%--        <h4>Employment</h4>   
    
      <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert-danger" />

    <div class=" form-group">
         <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentStatusID" ID = "Field_EmploymentStatusID" runat="server" IsRequired="True" LabelWidth="200"
           CustomCaption="Employment Status" ClientIDMode="Static" 
             ExcludedIDValues="98" />

    </div>

            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentStatusID" ID = "Field_EmploymentStatusID" runat="server" IsRequired="True" LabelWidth="200"
           CustomCaption="Employment Status" ClientIDMode="Static" 
             ExcludedIDValues="98" />
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentIntensityID" ID = "StudentEmploymentHistoryField1" runat="server" IsRequired="True" LabelWidth="200"
           CustomCaption="Employment Intensity" ClientIDMode="Static" 
             ExcludedIDValues="98"/>
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfEmploymentID" ID = "StudentEmploymentHistoryField2" runat="server" IsRequired="True" LabelWidth="200"
           CustomCaption="Employment Length" ClientIDMode="Static" 
             ExcludedIDValues="98" />--%>

        <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* Please tell us your employment status</span>
             <asp:DropDownList ID="selectEmployed" runat="server"  width="260" CssClass="textfield form-control" EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="10">In paid employment</asp:ListItem>
             <asp:ListItem value="11">Not in paid employment, looking for work and available to start work</asp:ListItem>
             <asp:ListItem value="12">Not in paid employment, not looking for work and/or not available to start work</asp:ListItem>
             </asp:DropDownList>
          </div>
      </div>

    <!-- START YES Employed - These are all related to YES employed -->


      <div class="row"  id="divEmploymentLength" style="display:none">
          <div class="col-sm-4 columns form-group"> 
         <span class="textfieldlabelrequired">Are you self Employed?</span>
        <asp:RadioButtonList runat="server" ID="rdoSelfEmp" CssClass="textfield form-control radiofield" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>        
        </asp:RadioButtonList>
              </div>
        <div class="col-sm-4 columns form-group"> 
              <span class="textfieldlabelrequired">* Length of time in employment</span>
             <asp:DropDownList ID="selectEmploymentLength" runat="server"   CssClass="textfield form-control" EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="1">Upto 3 months</asp:ListItem>
             <asp:ListItem value="2">4-6 months</asp:ListItem>
            <asp:ListItem value="3">7-12 months</asp:ListItem>
                 <asp:ListItem value="4">Over 12 months</asp:ListItem>
             </asp:DropDownList>
          </div>
            <div class="col-sm-4 columns form-group"> 
              <span class="textfieldlabelrequired">* Hours per week</span>
             <asp:DropDownList ID="selectEmploymentIntensity" runat="server"   CssClass="textfield form-control" EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="5">Employed for 0 to 10 hours per week</asp:ListItem>
             <asp:ListItem value="6">Employed for 11 to 20 hours per week</asp:ListItem>
            <asp:ListItem value="7">Employed for 21 to 30 hours per week</asp:ListItem>
                 <asp:ListItem value="8">Employed for 31+ hours per week</asp:ListItem>
             </asp:DropDownList>
          </div>
      </div>
     <div class="row"  id="divEmploymentIntensity" style="display:none">
      
     <!--    <div class="col-sm-4 columns form-group"> 
             <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="DateFrom"  ID="StudentEmploymentHistoryField2" runat="server" IsRequired="false" Width="150" CustomFieldType="Date"
           CustomCaption="* Employed From date" PlaceHolder="dd/mm/yyyy"/>
          </div> -->
           <div class="col-sm-4 columns form-group"> 
                
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="JobTitle"  ID="StudentEmploymentHistoryField1" runat="server" IsRequired="false"    CustomCaption="Job Title " />
          </div>
           <div class="col-sm-4 columns form-group"> 
                
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined54"  ID="txtGrossSalary" runat="server" IsRequired="false"  CustomCaption="* Annual Gross Salary (£)" />
          </div>
      </div>
                   <div class="row" id="divEmployerName" style="display:none">
      
           
         <div class="col-sm-4 columns form-group"> 
        
                 <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmployerName"  ID="Field_employername" runat="server" IsRequired="false" LabelWidth="200"
           CustomCaption="* Organisation Name" CssClass="textfieldlabelrequired" />
 
          </div>
             <div class="col-sm-4 columns form-group"> 
         
                 <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="ContactTel"  ID="StudentEmploymentHistoryField3" runat="server" IsRequired="false" LabelWidth="200"
           CustomCaption="* Telephone No"  CssClass="textfieldlabelrequired"/>
 
          </div>
            <div class="col-sm-4 columns form-group"> <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="Email"  ID="StudentEmploymentHistoryField4" runat="server" IsRequired="false" LabelWidth="200"
           CustomCaption="* Email"  CssClass="textfieldlabelrequired"/>
      </div>
         </div>

   <div class="row"  id="divUnEmploymentLength" style="display:none">
        <div class="col-sm-3 columns form-group"> 
              <span class="textfieldlabelrequired">* Length of time unemployed</span>
             <asp:DropDownList ID="selectLengthUnemployed" runat="server"  CssClass="textfield form-control" EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="1">Less than 6 months</asp:ListItem>
             <asp:ListItem value="2">6-11 months</asp:ListItem>
            <asp:ListItem value="3">12-23 months</asp:ListItem>
                 <asp:ListItem value="4">24-25 months</asp:ListItem>
                          <asp:ListItem value="5">Over 36 months</asp:ListItem>
             </asp:DropDownList>
          </div>
      </div>
    </div>
  
     
<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Benefits</h4>

        <div class="row">
                       <div class="col-sm-3 columns form-group"> 
             <span class="textfieldlabelrequired">* Do you receive any benefits?</span>
             <asp:DropDownList ID="selectBenefits" runat="server"  CssClass="textfield form-control" EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="01">Learner is in receipt of Job Seekers Allowance (JSA)</asp:ListItem>
             <asp:ListItem value="04">Learner is in receipt of Universal Credit</asp:ListItem>
             <asp:ListItem value="05">Learner is in receipt of Employment and Support Allowance (all categories)</asp:ListItem>
             <asp:ListItem value="06">Learner is in receipt of other state benefits</asp:ListItem>
         </asp:DropDownList>
                   </div>
           <div class="col-sm-3 columns form-group">
              <p>I receive no benefits</p>
              <asp:CheckBox runat="server" ID="chkNoStateBen">
              </asp:CheckBox>
          </div>
    </div>

     <div class="row" id="divwhatbenefit">
                <div class="col-sm-12 columns form-group">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined5" ID="txtWhatOther" runat="server" Visible="true" LabelWidth="600" IsRequired="false"  CustomCaption="* What is the other state benefit?"/>
         </div></div>


<div class="container">
        <div class="row"  id="divUCQuestions" style="display:none">

        <p>If you answered yes to either "Universal Credit" or "other state benefit" above, please answer any of the following that apply:</p>

        <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* My take-home pay is less than 16 times the appropriate age-related rate of national minimum wage/national living wage a week, or £892 per month (individual claim) or £1,437 a month (household claim)</span>
             <asp:DropDownList ID="selectDropDownTakeHomePay" runat="server" CssClass="textfield form-control"  Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes - Please attach recent payslip or P60 as evidence</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
    </div>

         <div class="row">
                      <div class="col-sm-12 columns form-group"> 
             <span class="textfieldlabelrequired">* My Universal Credit is: Work related requirements, Work preparation OR Work Focused Interview groups</span>
             <asp:DropDownList ID="selectDropDownUniversalCredit" runat="server" CssClass="textfield form-control"  Width="265">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
             </asp:DropDownList>
                </div>
    </div>

    </div>
</div>
        
<div class="container mt-4">
        <div class="panel panel-primarylcg" id="divBeneifts">
         <h2>Benefit/Low Wage Upload (Evidence must be dated within 3 months)</h2>
         <hr /><strong>Upload area:</strong><br />
    <div class="row">
        <div class="col-md-3">
            Type of Evidence
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CssClass="txtnotes">
                                  <asp:ListItem value="">Please select...</asp:ListItem>
                                <asp:ListItem Text="Benefit Evidence" Value="Benefit Evidence"></asp:ListItem>
                                <asp:ListItem Text="Low Wage Evidence" Value="Low Wage Evidence"></asp:ListItem>
                            </asp:DropDownList>
        </div>
        
        <div class="col-md-3">
            Upload File
                            <%--
                                Following properties are there to use in the File Upload control
                                - IsRequired (To set control mandatory)
                                - RequiredErrorMessage (A message to display when user is not uploading file)
                                - MaxAllowedFileSize (Maximum size allowed for a file upload in KB). Use this to override value set in System Setting of same name.
                                - MaxAllowedFileSizeErrorMessage  (A message to display when user has uploaded larger file than allowed)
                                - SupportedFileTypes (File Types supported by the control (.jpg, .png, .xlsx)). Use this to override value set in System Setting of same name.
                                - SupportedFileTypesErrorMessage (A message to display when user has uploaded file of type which is not valid)
                                - HideUserInfoOnTooltip (To prevent showing of information related to file upload requirements)
                                - UserInfo (User Information related to file upload requirements - if need to display at any specific location manually)
                            --%>
            <cc1:CCCFileUpload ID="fuAttachment" runat="server" data-html="true" ClientIDMode="static" IsRequired="true" />
        </div>
        <div class="col-md-3">
            <p>I cannot upload Evidence</p>
            <input type="checkbox" id="ChkOverride" runat="server" />
        </div>
        <div class="col-md-3">
            <p>Now press Upload to finish uploading</p>
            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-success" CausesValidation="true" />
        </div>
    </div>
     

        <br />
        <asp:ValidationSummary ID="vsAttachments" runat="server" CssClass="alert alert-danger" />
        <hr />
        <div>
            <table id="tblUploadedInfo" class="table table-striped table-bordered text-center" style="border-style: None;">
                <tbody>
                    <asp:Repeater ID="rptAttachments" runat="server" OnItemCommand="rptAttachments_ItemCommand">
                        <HeaderTemplate>
                            <tr class="searchgridheader">
                                <th scope="col" style="width: 20%">Type of Evidence</th>
                             
                                <th scope="col" style="width: 15%">Attachment</th>
                                <th scope="col" style="width: 10%">Remove</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="searchgridcell text-left">
                                <td><%#: Eval("TypeOfEvidence") %></td>
                               
                                <td><%#: Eval("FileName") %></td>
                                <td class="text-center">
                                    <asp:Button ID="btnRemove" runat="server" Text="X" CssClass="btn btn-danger" CommandName="RemoveAttachment" CommandArgument='<%#: Eval("AttachmentID") %>' OnClientClick="return confirmDeletion()" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr id="trNoItems" runat="server" class="searchgridcell" visible="false">
                        <td colspan="4">No attachments uploaded yet
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    
    </div>
</div>
 </div>
      
<!--
  <asp:button runat="server" id="btnNoPreviousEmployment" cssClass="show_hide btn btn-primary" text="No previous employment" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
    -->

<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_enrolments2_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_quals_on_entry_aspx" />
            </span>
        </div>
    </div>
</div>

<script type="text/javascript">
           $(document).ready(function () {

               $("#divwhatbenefit").hide();

               if ($("#<%= selectBenefits.ClientID %>").val() == "06") {
                   $("#divwhatbenefit").show();
               }

               $("#<%= selectBenefits.ClientID %>").change(function () {
                   if ($("#<%= selectBenefits.ClientID %>").val() == "06") {
                       $("#divwhatbenefit").show();
                    }
                    else {
                       $("#divwhatbenefit").hide();
                    }
                 
                });


              
         });

       </script>