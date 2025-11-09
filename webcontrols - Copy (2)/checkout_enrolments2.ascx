<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolments2.vb" Inherits="webcontrols_checkout_enrolments2" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
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
<!--
                <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian - Emergency</a></li>                   
                    <li>Further Details</li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
 
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                </ol>
    -->
<div class="progress" style="height: 20px;">
  <div class="progress-barlcg" role="progressbar" style="width: 35%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li><strong>Further Details</strong></li>
                   <li>Employment</li>
                    <li>Qualifications</li>
         <li>Course Details</li>
                     <li>Declarations</li>
                    </ol>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
<div class="container">
   <div class="row">
      <div class="col-sm-12 columns form-group"> 
       <h2>Eligibility</h2>
          </div>
  </div>
        <div class="row">
       <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="fldNationalityID" runat="server"  IsRequired="true"   CustomCaption="* Nationality" />
        </div>
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="StudentEnrolmentField20" runat="server"  IsRequired="true"  LabelWidth="300" CustomCaption="* Home Country (permanent residence)" />
        </div>
 

    </div>
 <div class="row" id="uk">
        <div class="col-sm-12 columns form-group"> 
            <p><strong>* Are you a UK national and have you been ordinarily resident in the UK or EEA for at least the previous three years?</strong></p>
              <asp:DropDownList ID="selectEuro" runat="server" CssClass="textfield form-control"  Width="200">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
         </asp:DropDownList>
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EuroResidentID" ID="fldEuro" runat="server" IsRequired="false" Visible="false"  />
          </div>
     </div>
     <div class="row" id="ukEEA">
               <div class="col-sm-12 columns form-group"> 
            <p><strong>* Are you an EEA national (non-Irish), have obtained pre-settled/settled status under the EU settlement scheme, and have lived continuously in the EEA or UK for at least the previous three years?</strong></p>
              <asp:DropDownList ID="selectPreSettle" runat="server" CssClass="textfield form-control" Width="200">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
         </asp:DropDownList>
               
          </div>
     </div>
    <div class="row" id="ukNonUK">
       <div class="col-sm-12 columns form-group"> 
                 
            <p><strong>* Are you a non-UK national, have permission to live in the UK for purposes other than education only, have obtained pre-settled/settled status under the EU settlement scheme, and have been ordinarily resident in the UK (or Ireland if an Irish national) for at least the previous three years?</strong></p>
              <asp:DropDownList ID="selectEducation" runat="server" CssClass="textfield form-control"  Width="200">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
         </asp:DropDownList>
             
          </div>
           </div>


        <div class="panel panel-primarylcg" id="divAssessment" style="display:none">
         <h2>Eligibility Assessment</h2>

    <p>This section has been designed to ensure that induction staff gain the correct information from prospective students to ensure eligibility for funding and that, where necessary,  original relevant evidence is seen. </p>

    <div class="application-form__form-wrapper">

     <p>NOTE</p>
       <ul>

           <li>Spouses/Civil Partners: eligibility for those who have participated in a formal state-recognised
marriage or a state-recognised civil partnership ceremony</li>
           <li>Family member defined as: husband/wife/civil partner/child or grandchild or dependent parent or
grandparent</li>
       </ul>
        <p>* Please tick the category that applies to YOUR status (referred to as ‘You’ below)</p>
        <table class="table table-striped table-bordered">
            <tr >
                <th  class="th-lcg"><strong>SECTION 1</strong></th>
                <th  class="th-lcg"><strong>EVIDENCE REQUIRED</strong></th>
                <tr>
                    <td class="td-lcg">                            You have been granted one of the following by the UK Government:                    </td>
                    <td class="td-lcg">
                            These categories are exempt from the 3-year residency rule. Please provide:

                    </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkDiscretionaryRemain" runat="Server" Text="Discretionary Leave to Enter/Remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkExceptional" runat="Server" Text="Exceptional Leave to Enter/Remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkIndefinite" runat="Server" Text="Indefinite Leave to Enter/Remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAfghan" runat="Server" Text="Afghan Locally Engaged Staff under the intimidation policy" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkHumanitarian" runat="Server" Text="Humanitarian Protection" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkOutside" runat="Server" Text="Leave Outside the Rules" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkhusband" runat="Server" Text="You are the husband, wife, civil partner or child of any of the above" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkSection67" runat="Server" Text="Section 67 of the Immigration Act 2016 leave" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkCalais" runat="Server" Text="Calais leave to remain" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
             </td>
                <td style="vertical-align:middle" >
                    Visa page of passport, stating permission granted AND letter from UK Visa or Immigration service<br />AND/OR evidence of your relationship to the person who has been granted this status
                </td>
            </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist"> 
                    <asp:CheckBox id="chkrefugee" runat="Server" Text="You are recognised as a refugee by the government (granted refugee status) OR the spouse or child of a refugee" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                    Visa page of passport, stating permission granted AND Home Office letter OR Travel Document (looks like a British passport; normally blue or black) WITH first page paragraph (with travel limitations)                </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkTurkish" runat="Server" Text="You are a child of a lawfully employed Turkish worker who is eligible if: the Turkish worker is ordinarily resident in the UK on or before 31 December 2020 and has Turkish European Community Association Agreement (ECAA) rights or extended ECAA leave, and the child has been ordinarily resident in the UK, EEA and/or Turkey for at least the previous 3 years on the first day of learning and is resident in the UK on or before 31 December 2020" CssClass="checkbox-inline" ></asp:CheckBox>
                      </div>
                </td>
                <td style="vertical-align:middle" >
                   Parent’s passport or Visa page of parent’s passport                </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAsylumPending" runat="Server" Text="You are an asylum seeker who has legally been in the UK pending consideration of their claim by the Home Office for longer than six months." CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkLA1989" runat="Server" Text="You are in care of the local authority and are receiving local authority support under section 23C or 23CA of the Children Act 1989" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAsylumRefused" runat="Server" Text="You are an asylum seeker who has been refused asylum but one of the following applies: You have appealed against the decision made by the UK Government against granting refugee status and no decision has been made within 6 months of lodging the appeal" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkGrantedSupport" runat="Server" Text="You have been granted support under Section 4 of the Immigration & Asylum Act 1999" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkLA1948" runat="Server" Text="You are in care of the local authority and are receiving local authority support under section 23C or 23CA of the Children Act or Section 21 of the National Assistance Act 1948" CssClass="checkbox-inline" ></asp:CheckBox><br />
                 </div>
             </td>
                <td style="vertical-align:middle" >
                    Application Registration Card (ARC) ‘to check date when asylum was claimed’ (more than 6 months old) AND Post Office receipt (less than 1 month old if available) OR Azure card to demonstrate you are currently supported under the Immigration & Asylum Act 1999
                    <br /><br />Home Office letter showing section 4 support, dated within the three months of issue date AND any other documentation from UK Visa or Immigration Service or solicitor to evidence appeal 
                </td>
            </tr>
                <tr>
                    <td class="td-lcg">                            You are aged 16-18 OR you are 19+ years on a continuing learning aim that you started when you were 16-18 years old. You:                     </td>
                    <td class="td-lcg">                        Evidence as per category below:                    </td>
                </tr>
           <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAsylum" runat="Server" Text="are an asylum seeker" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Home Office letter including date of birth                </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkParent" runat="Server" Text="are accompanying parents who have right of abode OR leave to enter OR leave to remain in the UK" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Relevant page of your passport AND your parents’ passports, showing accurate status                </td>
             </tr>
           <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkDiplomat" runat="Server" Text="are the child of a diplomat" CssClass="checkbox-inline" ></asp:CheckBox>
                        </div>
                </td>
                <td style="vertical-align:middle" >
                    Embassy letter                </td>
             </tr>
            <tr>
                <td> 
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkTeacher" runat="Server" Text="are a dependant of a teacher on an exchange scheme" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Your passport AND school or college letter                </td>
             </tr>
           <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkEEA" runat="Server" Text="are not accompanied by your parents but hold a full British Citizen OR EEA passport (not British Overseas passport)" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Relevant page of your passport                </td>
             </tr>
            <tr>
                <td> 
                       <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAbode" runat="Server" Text="have a Right of Abode in the UK " CssClass="checkbox-inline" ></asp:CheckBox>
                     </div>
                </td>
                <td style="vertical-align:middle" >
                   Relevant page of your passport OR Certificate of Entitlement of Registration                </td>
             </tr>
           <tr>
                <td> 
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkSocial" runat="Server" Text="Relevant page of your passport OR Certificate of Entitlement of Registration" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                    Letter from Social Services                </td>
             </tr>
            <tr>
                <th  class="th-lcg"  colspan="2"><strong>SECTION 2</strong></th>
             </tr>
            <tr >
             <td  colspan="2"> 
                 <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkNoAssess" runat="Server" Text="None of the above categories apply to my current status. Please supply as much information as possible to the LCG about your status to enable us to make a decision on your eligibility for funding on an additional page." CssClass="checkbox-inline" ></asp:CheckBox>
                     </div>
                </td>
            </tr>

        </table>
    </div>

    <hr /><strong>Upload area:</strong><br />
    <div class="row">
        <div class="col-md-3">
            Type of Evidence
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CssClass="txtnotes">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                <asp:ListItem Text="Pension Statement" Value="Pension Statement"></asp:ListItem>
                                <asp:ListItem Text="Payslip" Value="Payslip"></asp:ListItem>
                                <asp:ListItem Text="Bank Statement" Value="Bank Statement"></asp:ListItem>
                                <asp:ListItem Text="Household income evidence" Value="Household income evidence"></asp:ListItem>
                                <asp:ListItem Text="Tax Credit Award letter" Value="Tax Credit Award letter"></asp:ListItem>
                                <asp:ListItem Text="DSA/PIP/ESA Award notice" Value="DSA/PIP/ESA Award notice"></asp:ListItem>
                                <asp:ListItem Text="Local Authority Letter" Value="Local Authority Letter"></asp:ListItem>
                                <asp:ListItem Text="P60/" Value="P60/"></asp:ListItem>
                                <asp:ListItem Text="Benefit Evidence" Value="Benefit Evidence"></asp:ListItem>
                                <asp:ListItem Text="Award Letter (Asylum)" Value="Award Letter(Asylum)"></asp:ListItem>
                                <asp:ListItem Text="Loan Confirmation" Value="Loan Confirmation"></asp:ListItem>
                                <asp:ListItem Text="Other…" Value="Other…"></asp:ListItem>
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

      <div class="row">
             <div class="col-sm-12 columns form-group"> 
                <p>It is a requirement for Learning Curve Group to verify that we have seen personal identification for each of our learners.</p> </div>
            </div>
            <div class="row">
       <div class="col-sm-6 columns form-group">       
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="VerificationOtherDescription" ID="StudentEnrolmentField1" runat="server" IsRequired="true"  CustomCaption=" Verification Type"/>
         </div>

    </div>

 </div>



<h2>Equal Opportunities</h2>

<div class="container">

      <div class="row">
          <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="StudentEnrolmentField3" runat="server" IsRequired="true"  ExcludedIDValues="99" CustomCaption="* What is your ethnic group" LabelWidth="300"/>
          </div>

    </div>

    <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <p><strong>* Do you have any Special Education Needs or learning / disabilities?</strong></p>          
            <asp:DropDownList runat="server" ID="selectLearnDiff"  CssClass="textfield form-control" >
                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                <asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>
            </asp:DropDownList>
          <div style="display:none">
             <cc1:StudentEnrolmentField Visible="true" ClientIDMode="Static" StudentEnrolmentFieldType="LearningDiffOrDisID" ID="fldLearningDiffOrDisID" runat="server" IsRequired="false"   />
      </div>
          </div>
    </div>
    <div class="row"  id="disfields">
      <div class="col-sm-6 columns form-group"> 
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="stuDisabilityCategory1ID" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="* Please specify main learning/disability" ExcludedIDValues="99"/>
              <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" runat="server" Visible="true" IsRequired="false"  LabelWidth="300" CustomCaption="And, if appropriate, a secondary learning difficulty" />
        </div>
         
      </div>
   
    <div class="row">
     
    </div>


    <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_parentguardian_aspx" />
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="checkout_employment" CausesValidation="true" EnableEnterKey="true" />
</div>


    <script type="text/javascript">
        $(document).ready(function () {



           $("#disfields").hide();
        if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
            }
            $('#<%= selectLearnDiff.ClientID %>').change(function () {
                 // $('#cboEuroResidentID').checked=false;
                if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                    $("#disfields").show();

                    return;
                }
                else {
                    $("#disfields").hide();
                }
            });


            $("#divAssessment").hide();
            if (($("#<%=selectEuro.ClientID%>").val() == "2") && ($("#<%=selectPreSettle.ClientID%>").val() == "2") && ($("#<%=selectEducation.ClientID%>").val() == "2")) {
                $("#divAssessment").show();
            }
            $('#<%= selectEuro.ClientID %>').change(function () {
                hideshowAssessment();
            });
            $('#<%= selectPreSettle.ClientID %>').change(function () {
                hideshowAssessment();
            });
            $('#<%= selectEducation.ClientID %>').change(function () {
                 hideshowAssessment();
               
            });

            function hideshowAssessment()
                {

                if (($("#<%=selectEuro.ClientID%>").val() == "2") && ($("#<%=selectPreSettle.ClientID%>").val() == "2") && ($("#<%=selectEducation.ClientID%>").val() == "2")) {
                    $("#divAssessment").show();

                    return;
                }
                else {
                    $("#divAssessment").hide();
                }
            }


            $("#ukEEA").hide();
            $("#ukNonUK").hide();
    
         

          
            $('#<%= selectEuro.ClientID %>').change(function () {
                if ($("#<%=selectEuro.ClientID%>").val() == "2") {
                    $("#ukEEA").show();
                }
                if ($("#<%=selectEuro.ClientID%>").val() == "1") {
                    $("#ukEEA").hide();
                    $("#ukNonUK").hide();
                }
            });
            $('#<%= selectPreSettle.ClientID %>').change(function () {
                if ($("#<%=selectPreSettle.ClientID%>").val() == "2") {
                    $("#ukNonUK").show();
               }
               else {
                    $("#ukNonUK").hide();
               }
           });

        });

    </script>