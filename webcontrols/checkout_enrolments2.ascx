<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolments2.ascx.vb" Inherits="webcontrols_checkout_enrolments2" %>

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

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID=<%=CourseInformationID %>"><i class="fa-solid fa-scroll"></i> Course Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/courseenrol.ascx&OfferingID=<%=OfferingID %>"><i class="fa-solid fa-circle-info"></i> Information</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> Personal Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx"><i class="fa-solid fa-people-group"></i> Guardian / Emergency</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-earth-americas"></i> Further Details</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 40%">40%</div>
</div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3" id="div1" runat="server">
    <h4><i class="fa-solid fa-square-caret-right"></i> Eligibility</h4>

        <div class="row">
       <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="fldNationalityID" runat="server" IsRequired="true" CustomCaption="* Nationality" />
        </div>
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="StudentEnrolmentField20" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="* Home Country (permanent residence)" />
        </div>
 

    </div>
 <div class="row">
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
     <div class="row euroFields">
               <div class="col-sm-12 columns form-group"> 
            <p><strong>* Are you an EEA national (non-Irish), have obtained pre-settled/settled status under the EU settlement scheme, and have lived continuously in the EEA or UK for at least the previous three years on your first day in learning?</strong></p>
              <asp:DropDownList ID="selectPreSettle" runat="server" CssClass="textfield form-control" Width="200">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
         </asp:DropDownList>
               
          </div>
     </div>

<div class="row non-UK">
       <div class="col-sm-12 columns form-group"> 
                 
            <p><strong>* Are you a non-UK national, have permission to live in the UK for purposes other than education only, have obtained pre-settled/settled status under the EU settlement scheme, and have been ordinarily resident in the UK (or Ireland if an Irish national) for at least the previous three years on your first day in learning?</strong></p>
              <asp:DropDownList ID="selectEducation" runat="server" CssClass="textfield form-control"  Width="200">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="1">Yes</asp:ListItem>
             <asp:ListItem value="2">No</asp:ListItem>
         </asp:DropDownList>
             
          </div>
           </div>


     <div class="row" id="EUSSShareCode">
               <div class="col-sm-12 columns form-group"> 
            <p><strong>* Please provide your immigration share code</strong></p>
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined16" ID="EUSSCode" runat="server" IsRequired="false"  CustomCaption="* Immigration Share Code"/>
               
          </div>
     </div>
    

    <div class="row">
       <div class="col-sm-12 columns form-group"> 
                 
            <p><strong>* Do you currently have permission to stay in the UK for at least 12 months?</strong></p>
              <asp:DropDownList ID="selectUK12months" runat="server" CssClass="textfield form-control"  Width="200">
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

           <li>Spouses/Civil Partners: eligibility for those who have participated in a formal state-recognised marriage or a state-recognised civil partnership ceremony</li>
           <li>Family member defined as: husband/wife/civil partner/child or grandchild or dependent parent or grandparent</li>
       </ul>
        <p>* Please tick the category that applies to YOUR status (referred to as ‘You’ below)</p>
        <table class="table table-striped table-bordered">
            <tr >
                <th  class="th-lcg"><strong>SECTION 1</strong></th>
                <th  class="th-lcg"><strong>EVIDENCE REQUIRED</strong></th>
                <tr>
                    <td class="td-lcg">
                            You have been granted one of the following by the UK Government:
                    </td>
                    <td class="td-lcg">
                            Please provide:

                    </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkDiscretionaryRemain" runat="Server" Text="Discretionary Leave to Enter/Remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                   <!-- <asp:CheckBox id="chkExceptional" runat="Server" Text="Exceptional Leave to Enter/Remain" CssClass="checkbox-inline" ></asp:CheckBox><br />-->
                    <asp:CheckBox id="chkIndefinite" runat="Server" Text="Indefinite Leave to Enter/Remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAfghan" runat="Server" Text="A person granted stateless leave is a person who has extant leave to remain as a stateless person under the immigration rules (within the meaning given in section 33(1) of the Immigration Act 1971)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkHumanitarian" runat="Server" Text="Humanitarian Protection" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkOutside" runat="Server" Text="Leave Outside the Immigration Rules" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkUkraine" runat="Server" Text="Ukraine Family Scheme" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkUkraineSpon" runat="Server" Text="Ukraine Sponsorship Scheme (Homes for Ukraine)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkUkraineExt" runat="Server" Text="Ukraine Extension Scheme or Ukraine Permission Extension Scheme" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkhusband" runat="Server" Text="You are the husband, wife, civil partner or child of any of the above" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkSection67" runat="Server" Text="Section 67 of the Immigration Act 2016 leave" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkCalais" runat="Server" Text="Calais leave to remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                        <asp:CheckBox id="chkdomesticabuse" runat="Server" Text="As a victim of domestic abuse where they have been ordinarily resident in the UK since they were given leave to remain" CssClass="checkbox-inline" ></asp:CheckBox><br />
                        <asp:CheckBox id="chkbereavedpartner" runat="Server" Text="As a bereaved partner, where they have been ordinarily resident in the UK since they were given leave to remain or enter" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAfghanPitting" runat="Server" Text="British Nationals evacuated from Afghanistan under Operation Pitting" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAfghanEvac" runat="Server" Text="British Nationals evacuated from Afghanistan by UK Government before 6th Jan 2022" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAfghanResettle" runat="Server" Text="Individuals with leave to enter or remain in the UK under the Afghan Citizens Resettlement Scheme (ACRS)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAfghanEnterRemain" runat="Server" Text="Individuals with leave to enter or remain in the UK under the Afghan Relocations and Assistance Policy (ARAP)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkBIOT" runat="Server" Text="British citizens who were born in the British Indian Ocean Territory or, prior to 8 November 1965, in those islands designated as the British Indian Ocean Territory on that date, or are direct descendants of a person who was born in the British Indian Ocean Territory or, prior to 8 November 1965, in those islands designated as the British Indian Ocean Territory on that date" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    

                   
                    
                    </div>
             </td>
                <td style="vertical-align:middle" >
                    Evidence of immigration permission inc. Biometric Residence Permit (BRP)
                    <br />AND letter from UK Visa or Immigration service
                    <br /><br />AND/OR evidence of your relationship to the person who has been granted this status
                    <br /><br />Immigration Share Code to be provided to evidence current status
                </td>
            </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist"> 
                    <asp:CheckBox id="chkrefugee" runat="Server" Text="You are recognised as a refugee by the government (granted refugee status) OR the spouse or child of a refugee" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                    Visa page of passport, stating permission granted
                    <br />AND Home Office letter 
                    <br />OR Travel Document (looks like a British passport; normally blue or black) WITH first page paragraph
                    <br />(with travel limitations)
                </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkTurkish" runat="Server" Text="You are a child of a lawfully employed Turkish worker who is eligible if:<br />the Turkish worker is ordinarily resident in the UK on or before 31 December 2020 and has Turkish European Community Association Agreement (ECAA) rights or extended ECAA leave, and the child has been ordinarily resident in the UK, EEA and/or Turkey for at least the previous 3 years on the first day of learning and is resident in the UK on or before 31 December 2020" CssClass="checkbox-inline" ></asp:CheckBox>
                      </div>
                </td>
                <td style="vertical-align:middle" >
                   Parent’s passport or Visa page of parent’s passport
                </td>
             </tr>

            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAsylumPending" runat="Server" Text="You are an asylum seeker who has legally been in the UK pending consideration of their claim by the Home Office for longer than six months." CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <!--<br /><asp:CheckBox id="chkLA1989" runat="Server" Text="You are receiving local authority support under section 23C, 23CA of the Children Act 1989 or the Care Act 2014" CssClass="checkbox-inline" ></asp:CheckBox><br /> -->
                 </div>
             </td> 
                <td style="vertical-align:middle" >
                    Application Registration Card (ARC) 'to check date when asylum was claimed' (more than 6 months old) AND Post Office receipt (less than 1 month old if available)
                    <br />OR Azure card to demonstrate you are currently supported under the Immigration & Asylum Act 1999
                </td>
            </tr>

            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAsylumRefused" runat="Server" Text="You are an asylum seeker who has been refused asylum but one of the following applies:" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAsylumAppeal" runat="Server" Text="You have appealed against the decision made by the UK Government against granting refugee status and no decision has been made within 6 months of lodging the appeal" CssClass="checkbox-inline" ></asp:CheckBox><br />                    
                    <asp:CheckBox id="chkGrantedSupport" runat="Server" Text="You have been granted support under Section 4 of the Immigration & Asylum Act 1999" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkLA1948" runat="Server" Text="You are receiving local authority support under section 23C or 23CA of the Children Act" CssClass="checkbox-inline" ></asp:CheckBox><br />
                 </div>
             </td>
                <td style="vertical-align:middle" >
                    Home Office letter showing section 4 support, dated within the three months of issue date AND any other documentation from UK Visa or Immigration Service or solicitor to evidence appeal 
                </td>
            </tr>
                <tr>
                    <td class="td-lcg">
                            You are aged 16-18 OR you are 19+ years on a continuing learning aim that you started when you were 16-18 years old. You: 
                    </td>
                    <td class="td-lcg">
                        Evidence as per category below:
                    </td>
                </tr>
           <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAsylum" runat="Server" Text="are an asylum seeker" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Home Office letter including date of birth
                </td>
             </tr>
            <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkParent" runat="Server" Text="are accompanying parents who have right of abode OR leave to enter OR leave to remain in the UK" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Relevant page of your passport AND your parents’ passports, showing accurate status
                </td>
             </tr>
           <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkDiplomat" runat="Server" Text="are the child of a diplomat" CssClass="checkbox-inline" ></asp:CheckBox>
                        </div>
                </td>
                <td style="vertical-align:middle" >
                    Embassy letter
                </td>
             </tr>
            <tr>
                <td> 
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkTeacher" runat="Server" Text="are a dependant of a teacher on an exchange scheme" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Your passport AND school or college letter
                </td>
             </tr>
           <tr>
                <td>
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkEEA" runat="Server" Text="are not accompanied by your parents but hold a full British Citizen OR EEA passport (not British Overseas passport)" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                   Relevant page of your passport
                </td>
             </tr>
            <tr>
                <td> 
                       <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkAbode" runat="Server" Text="have a Right of Abode in the UK" CssClass="checkbox-inline" ></asp:CheckBox>
                     </div>
                </td>
                <td style="vertical-align:middle" >
                   Relevant page of your passport OR Certificate of Entitlement of Registration
                </td>
             </tr>
           <tr>
                <td> 
                    <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkSocial" runat="Server" Text="are in the care of Social Services/in receipt of Section 4 support" CssClass="checkbox-inline" ></asp:CheckBox>
                    </div>
                </td>
                <td style="vertical-align:middle" >
                    Letter from Social Services
                </td>
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
            </div>

    

    

      
   <div class="row">
       <div class="col-sm-6 columns form-group">       
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="VerificationOtherDescription" ID="StudentEnrolmentField1" runat="server" IsRequired="true"  CustomCaption="* Verification Type"/>
        <br><button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="e.g., full British passport or Residency permit with indefinite leave to remain.">
Hover over me for Verification Type example
        </button><br>
                <%--<br /><asp:TextBox ID="txtDateTest" runat="server" IsRequired="true"  CustomCaption="* Date Validated" Width="555"></asp:TextBox> --%>
        </div>
    </div>
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3" id="div2" runat="server">
    <h4><i class="fa-solid fa-square-caret-right"></i> Staff Use Only</h4>

    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentInternationalDetailUserDefined1" ID="StaffName" runat="server" IsRequired="false"  CustomCaption="Staff Name"></cc1:StudentEnrolmentField><br />

    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentInternationalDetailUserDefined2" ID="DateValidated" runat="server" IsRequired="false"  CustomCaption="Date Validated" HTML5InputType="Date"></cc1:StudentEnrolmentField><br />

    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CASID" ID="CASID" runat="server" IsRequired="false"  CustomCaption="Document Type"></cc1:StudentEnrolmentField><br />
   
    
    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PassportNumber" ID="DocumentNumberReference" runat="server" IsRequired="false" CustomCaption="Document Number / Reference" LabelWidth="1000"></cc1:StudentEnrolmentField><br />

    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PassportIssueDate" ID="ValidFrom" runat="server" IsRequired="false"  CustomCaption="Valid From" HTML5InputType="Date"></cc1:StudentEnrolmentField><br />

    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PassportExpiryDate" ID="ValidTo" runat="server" IsRequired="false"  CustomCaption="Valid To" HTML5InputType="Date"></cc1:StudentEnrolmentField><br />

</div>
<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Equal Opportunities</h4>

      <div class="row">
          <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="StudentEnrolmentField3" runat="server" IsRequired="true" Width="200" CustomCaption="* What is your ethnic group" LabelWidth="300"/>
          </div>

    </div>

    <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <p><strong>* Do you consider yourself to have a long term disability, health problem or any learning difficulties?</strong></p>          
            <asp:DropDownList runat="server" ID="selectLearnDiff"  CssClass="textfield form-control" Width="200" >
                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                <asp:ListItem Text="Not provided" Value="9"></asp:ListItem>
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

        <hr /><strong>Upload area:</strong><br />

    <div class="row">
       <div class="col-sm-12 columns form-group"> 
          <p>It is a requirement for Learning Curve Group to verify that we have seen personal identification for each of our learners.</p> </div>
      </div>

    <div class="row">
        <div class="col-md-3">
            Type of Evidence
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CssClass="textfield form-control txtnotes" Width="250">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                <asp:ListItem Text="British/Irish Passport" Value="British/Irish Passport"></asp:ListItem>
                                <asp:ListItem Text="British Driving Licence" Value="British Driving Licence"></asp:ListItem>
                                <asp:ListItem Text="British/Irish Birth Certificates" Value="British/Irish Birth Certificates"></asp:ListItem>
                                <asp:ListItem Text="PLR (16-18 YO)" Value="PLR (16-18 YO)"></asp:ListItem>
                                <asp:ListItem Text="Biometric Residence Permit (BRP)" Value="Biometric Residence Permit (BRP)"></asp:ListItem>
                                <asp:ListItem Text="Letter from UK Visa or Immigration service AND/OR evidence of your relationship to the person who has been granted this status" Value="Letter from UK Visa or Immigration service AND/OR evidence of your relationship to the person who has been granted this status"></asp:ListItem>
                                <asp:ListItem Text="EUSS code to be provided to evidence current status" Value="EUSS code to be provided to evidence current status"></asp:ListItem>
                                <asp:ListItem Text="Visa page of passport" Value="Visa page of passport"></asp:ListItem>
                                <asp:ListItem Text="Home Office letter" Value="Home Office letter"></asp:ListItem>
                                <asp:ListItem Text="Travel Document" Value="Travel Document"></asp:ListItem>
                                <asp:ListItem Text="Parent’s passport or Visa page of parent’s passport" Value="Parent’s passport or Visa page of parent’s passport"></asp:ListItem>
                                <asp:ListItem Text="Application Registration Card (ARC)" Value="Application Registration Card (ARC)"></asp:ListItem>
                                <asp:ListItem Text="Evidence of the stateless leave from Immigration service" Value="Evidence of the stateless leave from Immigration service"></asp:ListItem>
                                <asp:ListItem Text="Embassy letter" Value="Embassy letter"></asp:ListItem>
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
   
    <div class="row">
     
    </div>

</div>

<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_parentguardian_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_employment" />
            </span>
        </div>
    </div>
</div>

<div class="container">

   
</div>


    <script type="text/javascript">
        $(document).ready(function () {


      //      $(".euroFields").hide();
      //      $("#selectEducation").hide();
      //      if ($("#<%=selectEuro.ClientID%>").val() == "2") {
      //          $(".euroFields").show();
        //        $("#selectEducation").show();
       //     }



            $(".euroFields").hide();
            $(".non-UK").hide();

            if ($("#<%=selectEuro.ClientID%>").val() == "2") {
                $(".euroFields").show();
            }
            if ($("#<%=selectPreSettle.ClientID%>").val() == "2") {
                $(".non-UK").show();
            }
            $('#<%=selectEuro.ClientID %>').change(function () {
               // $('#cboEuroResidentID').checked=false;
                if ($("#<%=selectEuro.ClientID%>").val() == "2") {
                   $(".euroFields").show();
                    $(".non-UK").hide();
        
                    return;
                }
                else {
                    $(".euroFields").hide();
                    $(".non-UK").hide();
                }
            });


            $("#EUSSShareCode").hide();
            if ($("#<%=selectPreSettle.ClientID%>").val() == "1") {
                $("#EUSSShareCode").show();
            }

            $("#disfields").hide();
            if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
            }

            $('#<%= selectPreSettle.ClientID %>').change(function () {
                if ($("#<%=selectPreSettle.ClientID%>").val() == "1") {
                    $("#EUSSShareCode").show();
                    $(".non-UK").hide();
                    return;
                }
                else {
                    $("#EUSSShareCode").hide();
                    $(".non-UK").show();
                }
            });

$('#<%= selectEducation.ClientID %>').change(function () {
                if ($("#<%=selectEducation.ClientID%>").val() == "1") {
                    $("#EUSSShareCode").show();
                    return;
                }
                else {
                    $("#EUSSShareCode").hide();
                    $(".non-UK").show();
                }
            });



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
            if (($("#<%=selectEuro.ClientID%>").val() == "2") && ($("#<%=selectLearnDiff.ClientID%>").val() == "2") && ($("#<%=selectLearnDiff.ClientID%>").val() == "2")) {
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

            function hideshowAssessment() {

                if (($("#<%=selectEuro.ClientID%>").val() == "2") && ($("#<%=selectPreSettle.ClientID%>").val() == "2") && ($("#<%=selectEducation.ClientID%>").val() == "2")) {
                    $("#divAssessment").show();

                    return;
                }
                else {
                    $("#divAssessment").hide();
                }
            }
        });
    </script>

