<%@ Control Language="VB" AutoEventWireup="false"  CodeFile="checkout_enrolments.ascx.vb" Inherits="webcontrols_checkout_enrolments" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

</script>
<!--
<br />
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
 --> <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" Visible="false"/>
   
   <cc1:OfferingFeesDisplayAll runat="server" Visible="false" />

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/coursedisplay.ascx&CourseInformationID=<%=CourseInformationID %>"><i class="fa-solid fa-scroll"></i> Course Details</a></li>
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/courseenrol.ascx&OfferingID=<%=OfferingID %>"><i class="fa-solid fa-circle-info"></i> Information</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-user"></i> Personal Details</li>
        </ol>
    </div>
</nav>


<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 20%">20%</div>
</div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    


<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Personal Details</h4>

   <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <p>Please note all fields marked with <strong>*</strong> are required. </p>
          </div>
  </div>
  <div class="row" id="divRefno" runat="server" visible="false">
      <div class="col-sm-12 columns form-group"> 
    <h4>If you have already applied to the College or studied at the College as a student, your ID is <strong><asp:Label ID="lblRefno" runat="server"></asp:Label></strong> </h4>
          </div>
  </div>
    <div class="row">
    <div class="col-sm-6 columns form-group mb-3">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstName" runat="server" IsRequired="true"  CustomCaption="* First Name(s)"/>
     </div>
        <div class="col-sm-6 columns form-group mb-3">       
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true"  CustomCaption="* Surname"/>
     </div>
    </div>
  <div class="row">
      <div class="col-sm-6 columns form-group mb-3">            
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField7" runat="server" IsRequired="false"  CustomCaption="Middle name(s)"/>
          </div>
     
   </div>
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField id="DateOfBirth" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth" CustomCaption="* Date of birth" ClientIDMode="Static" HTML5InputType="date"  />
            <asp:CustomValidator ID="fldDateOfBirthValidator" runat="server"></asp:CustomValidator>
            <div class="alert alert-secondary" role="alert" id="AgeInfo">
                &nbsp;
            </div>
          <asp:Textbox runat="server" ID="Age31stAug" Placeholder="Age31stAug" type="number" ClientIDMode="Static" class="d-none" />
          </div>
      <div class="col-sm-6 columns form-group mb-3">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Sex" ID="StudentEnrolmentField6" runat="server"  IsRequired="true" CustomCaption="* Legal Sex"/>
          </div>
   </div>



<!--
<div class="container">
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          </div>
       <div class="col-sm-6 columns form-group"> 
          </div>
   </div>
</div>
    -->
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Address Details</h4>

    <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find your address, enter postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>
  <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
      <div class="col-sm-6 columns form-group mb-3"> 
          <cc1:StudentEnrolmentField runat="server" ID="txtAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" CustomCaption="* Address Line 1"/>
          </div>
       <div class="col-sm-6 columns form-group mb-3"> 
           <cc1:StudentEnrolmentField runat="server" ID="txtAddress2" StudentEnrolmentFieldType="Address2" CustomCaption="Address Line 2"/>
          </div>
   </div>
  
  <div class="row">
      <div class="col-sm-6 columns form-group mb-3"> 
          <cc1:StudentEnrolmentField runat="server" ID="txtAddress3" StudentEnrolmentFieldType="Address3"  CustomCaption="Address Line 2"/>
          </div>
       <div class="col-sm-6 columns form-group mb-3"> 
           <cc1:StudentEnrolmentField runat="server" ID="txtAddress4" StudentEnrolmentFieldType="Address4" CustomCaption="Address Line 4" />
          </div>
   </div>
    <div class="row">
         <div class="col-sm-3 columns form-group mb-3"> 
             <label for="postcode" style="font-weight:bold ">* Postcode</label><input runat="server" maxlength="9" onchange="this.value = this.value.toUpperCase();" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Your postcode here..." autocomplete="off" />
             </div>
           
    </div>
      </div>
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Contact Details</h4>
     <div class="row">
       <div class="col-sm-12 columns form-group">  <p><strong>You must provide at least one phone number below:</strong></p>
           </div>
         </div>
    <div class="row">
       <div class="col-sm-6 columns form-group mb-3"> 
  
   <cc1:StudentEnrolmentField CustomCaption="* Telephone No" StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField5" runat="server"  Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
            <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900">
Hover over me for Telephone format
</button>
           </div>
      <div class="col-sm-6 columns form-group mb-3"> 
             
           <cc1:StudentEnrolmentField CustomCaption="* Mobile No" StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server"  Pattern="^(07[\d]{8,12}|447[\d]{7,11})$"/>
       <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900">
Hover over me for Mobile format
</button>
          
      </div>
   </div>
      <div class="row">
        <div class="col-sm-12 columns form-group mb-3"> 
             <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true"  CustomCaption="* Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
            </div>
       </div>
   <!--  <div class="row">
          <div class="col-sm-12 columns form-group"> 
              <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HouseholdSituation1ID" ID="StudentEnrolmentField33" DefaultValue="99" runat="server" IsRequired="true"  ExcludedIDValues="98" LabelWidth="200" CustomCaption="* Your Household situation" />
          </div>
     </div> -->
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Supporting You</h4>
    <div class="row">
        <div class="col-sm-12 columns form-group mb-3"> 
            <p><strong>Learning Curve Group (LCG) is committed to supporting care leavers and 'looked after children' and therefore encourage candidates from these groups to study with us</strong>, we can also offer support and guidance to individuals from these groups from out student support and welfare teams.At LCG we deem a Care Leaver as any student who has spent 13 weeks or more in the care of the local authority (e.g. foster care or children’s home) between their 14th and 16th birthday, were privately fostered until the age of 16 or who were ‘looked after children’ until they were subject of a Special Guardianship Order.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Someone who has previously been in care but is now independent (usually aged 16–25)">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="StudentEnrolmentField16" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Have you previously been in Care (care leaver)?  (If so, you will need to provide a signed email or letter confirmation from a local authority appointed Personal Advisor to confirm this)"/>
        </div>
    </div>

    <div class="row d-none" id="LACLearner">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="A learner currently in the care of a local authority (e.g., foster care, residential care)"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="LookedAfter" ID="StudentEnrolmentField1" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Are you a Child In Care (LAC) (if so please provide Personal Education Plan (PEP))"/>
        </div>
    </div>

    <div class="row d-none" id="EHCPLearner">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="An EHCP is a legal document for learners (up to age 25) with <strong>special educational needs and disabilities (SEND)</strong> outlining required support" data-bs-html="true">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" runat="server" IsRequired="false" CustomCaption="Do you have an Educational Health Care Plan (EHCP)?" LabelWidth="300" />
        </div>
    </div>

    <div class="row d-none" id="KnownToSocialCare">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="The learner is currently receiving support or intervention from social services (e.g., Child in Need, Child Protection Plan)">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined53" runat="server" IsRequired="false" ID="StudentDetailUserDefined53" CustomFieldType="Lookup" CustomCaption="Are you Known to Social Care? (if so please select which is most appropriate)?" LabelWidth="300" />
        </div>
    </div>

    <div class="row d-none" id="KnownToYouthJusticeSystem">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="The learner has had involvement with youth offending services or justice system support">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined54" runat="server" IsRequired="false" ID="StudentDetailUserDefined54" CustomFieldType="Lookup" CustomCaption="Are you known to the Youth Justice System?" LabelWidth="300" />
        </div>
    </div>

    <div class="row d-none" id="FSMLearner">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="At any point in the last six years at school, did you receive free school meals?">
            <p>
                Have you received Free Meals in the last 6 years?
            </p>
            <div class="form-check form-check-inline" id="ReceivedFreeSchoolMealsYContainer" runat="server">
                <%--AutoPostBack="true"--%>
                <asp:RadioButton ID="ReceivedFreeSchoolMealsY" runat="server"
                    GroupName="ReceivedFreeSchoolMeals" Value="Y"
                    Text="Yes"
                    OnCheckedChanged="ReceivedFreeSchoolMeals_Changed" />
            </div>
            <div class="form-check form-check-inline" id="ReceivedFreeSchoolMealsNContainer" runat="server">
                <%--AutoPostBack="true"--%>
                <asp:RadioButton ID="ReceivedFreeSchoolMealsN" runat="server"
                    GroupName="ReceivedFreeSchoolMeals" Value="N"
                    Text="No"
                    OnCheckedChanged="ReceivedFreeSchoolMeals_Changed" />
            </div>
            <asp:CustomValidator ID="fldReceivedFreeSchoolMealsValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="The learner provides unpaid care for someone (e.g., family member with illness, disability, or addiction)">
            <p>
                Do you have Caring Responsibilities?
            </p>
            <div class="form-check form-check-inline" id="YoungCarerYContainer" runat="server">
                <%--AutoPostBack="true"--%>
                <asp:RadioButton ID="YoungCarerY" runat="server"
                    GroupName="YoungCarer" Value="Y"
                    Text="Yes"
                    OnCheckedChanged="YoungCarer_Changed" />
            </div>
            <div class="form-check form-check-inline" id="YoungCarerNContainer" runat="server">
                <%--AutoPostBack="true"--%>
                <asp:RadioButton ID="YoungCarerN" runat="server"
                    GroupName="YoungCarer" Value="N"
                    Text="No"
                    OnCheckedChanged="YoungCarer_Changed" />
            </div>
            <asp:CustomValidator ID="fldYoungCarerValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group mb-3" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="The learner has a child or is expecting a child">
            <p>
                Are you a Parent?
            </p>
            <div class="form-check form-check-inline" id="YoungParentYContainer" runat="server">
            
                <asp:RadioButton ID="YoungParentY" runat="server"
                    GroupName="YoungParent" Value="Y"
                    Text="Yes"
                    OnCheckedChanged="YoungParent_Changed" />
            </div>
            <div class="form-check form-check-inline" id="YoungParentNContainer" runat="server">
                <asp:RadioButton ID="YoungParentN" runat="server" 
                    GroupName="YoungParent" Value="N" 
                    Text="No"
                    OnCheckedChanged="YoungParent_Changed" />
            </div>
            <asp:CustomValidator ID="fldYoungParentValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Criminal Convictions</h4>

    <div class="row">
      <div class="col-sm-12 columns form-group"> 
                <p><strong>Rehabilitation of Offenders Act 1974 (Exceptions) Order 1975 (as amended in 2013) by SI 2013 1198</strong><br />Learning Curve is an inclusive training provider. 
                    You do not generally have to disclose details of ‘spent’ convictions. However, if the course you are applying for is exempt from the Rehabilitation of Offenders Act 
                    because it could involve access to persons who are disabled, addicted to drugs, alcohol or under 18 or over 65 years of age, you must disclose details of all convictions,
                    spent or otherwise. Courses requiring a full disclosure are also subject to a Disclosure & Barring Service (DBS) check. Disclosure of convictions does not automatically 
                    affect your admission to the course/programme, but allows the College to undertake a risk assessment and provide support as appropriate. You will be asked to provide 
                    further details of spent and unspent convictions if the course requires a Disclosure & Barring Service (DBS) check.</p>
                   
                  </div>
        </div>
          <div class="row">
         <div class="col-sm-12 columns form-group"> 
                     <a href="https://www.nacro.org.uk/resettlement-advice-service/support-for-individuals/disclosing-criminal-records/disclosing-criminal-records-applying-college/" target="_blank"><img  src="_images/nacro.png" alt="NACRO Logo" /></a>
       </div>
     </div>
      <div class="row">
            <div class="col-sm-12 columns form-group"> 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CriminalConvictionID" ID="StudentEnrolmentField11" runat="server" IsRequired="true" LabelWidth="450"   CustomCaption="*Do you have any unspent criminal convictions?" />
        </div>
      </div>
     <div class="row d-none">
           <div class="col-sm-12 columns form-group"> 
       <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcademicYearID" ID="AcademicYearID" runat="server" IsRequired="false" LabelWidth="450" ClientIDMode="Static" />
       </div>
     </div>
    <br />

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
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_parentguardian_aspx" />
            </span>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        let lacLearner = document.getElementById(`LACLearner`);
        let ehcpLearner = document.getElementById(`EHCPLearner`);
        let knownToSocialCare = document.getElementById(`KnownToSocialCare`);
        let knownToYouthJusticeSystem = document.getElementById(`KnownToYouthJusticeSystem`);
        let fsmLearner = document.getElementById(`FSMLearner`);

        function showLAC() {
            lacLearner.classList.remove(`d-none`);
        }

        function hideLAC() {
            lacLearner.classList.add(`d-none`);
        }

        function showEHCP() {
            ehcpLearner.classList.remove(`d-none`);
        }

        function hideEHCP() {
            ehcpLearner.classList.add(`d-none`);
        }

        function showKnownToSocialCare() {
            knownToSocialCare.classList.remove(`d-none`);
        }

        function hideKnownToSocialCare() {
            knownToSocialCare.classList.add(`d-none`);
        }

        function showKnownToYouthJusticeSystem() {
            knownToYouthJusticeSystem.classList.remove(`d-none`);
        }

        function hideKnownToYouthJusticeSystem() {
            knownToYouthJusticeSystem.classList.add(`d-none`);
        }

        function showFSM() {
            fsmLearner.classList.remove(`d-none`);
        }

        function hideFSM() {
            fsmLearner.classList.add(`d-none`);
        }

        //Age Calculation
        let dob = document.getElementById(`txtDateOfBirth`);

        if (dob.value !== null) {
            //If DOB already has a value then attempt to show age from DOB
            //alert(`|` + dob.value + `|`);
            showAge();
        }
        dob.addEventListener(`keyup`, function (event) {
            showAge();
        });
        dob.addEventListener(`blur`, function (event) {
            showAge();
        });

        showAge();
        function showAge() {
            let today = new Date();
            let academicYearID = document.getElementById(`cboAcademicYearID`);
            let date31stAug = new Date(`20` + academicYearID.value.substring(0, 2) + `-08-31`);
            let dateOfBirth = new Date(dob.value);

            let age31stAug = calculateAge(dateOfBirth, date31stAug);
            let AgeInfo = document.getElementById(`AgeInfo`);
            let AgeField = document.getElementById(`Age31stAug`);

            if (isNaN(dateOfBirth) || (dateOfBirth === ` `)) {
                AgeInfo.innerHTML = `&nbsp;`;
                AgeField.value = ``;
            }
            else {
                AgeInfo.innerHTML = `<i class="fa-solid fa-calendar-day"></i> Age on ${date31stAug.getDate()}${nth(date31stAug.getDate())} ${date31stAug.toLocaleString(`default`, { month: `long` })} ${date31stAug.getFullYear()}: <kbd>${age31stAug}</kbd>`;
                AgeField.value = age31stAug;
            }

            showHideFields(age31stAug);
        }

        function showHideFields(age31stAug) {
            if (age31stAug <= 18) {
                showLAC();
                showKnownToSocialCare();
            }
            else {
                hideLAC();
                hideKnownToSocialCare();
            }

            if (age31stAug <= 25) {
                showEHCP();
                showFSM();
                showKnownToYouthJusticeSystem();
            }
            else {
                hideEHCP();
                hideFSM();
                hideKnownToYouthJusticeSystem();
            }
        }
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        // Save scroll position before postback
        let form = document.getElementById('aspnetForm');
        if (form) {
            form.addEventListener('submit', function () {
                sessionStorage.setItem('scrollPos', window.scrollY);
            });
        }

        // Also catch RadioButton changes specifically
        let youngCarerY = document.getElementById('<%= YoungCarerY.ClientID %>');
        let youngCarerN = document.getElementById('<%= YoungCarerN.ClientID %>');
        let youngParentY = document.getElementById('<%= YoungParentY.ClientID %>');
        let youngParentN = document.getElementById('<%= YoungParentN.ClientID %>');

        if (youngCarerY) {
            youngCarerY.addEventListener('click', function () {
                sessionStorage.setItem('scrollPos', window.scrollY);
            });
        }
        if (youngCarerN) {
            youngCarerN.addEventListener('click', function () {
                sessionStorage.setItem('scrollPos', window.scrollY);
            });
        }

        if (youngParentY) {
            youngParentY.addEventListener('click', function () {
                sessionStorage.setItem('scrollPos', window.scrollY);
            });
        }
        if (youngParentN) {
            youngParentN.addEventListener('click', function () {
                sessionStorage.setItem('scrollPos', window.scrollY);
            });
        }

        // Restore scroll position after postback
        let scrollPos = sessionStorage.getItem('scrollPos');
        if (scrollPos) {
            window.scrollTo(0, parseInt(scrollPos));
            sessionStorage.removeItem('scrollPos');
        }
    });
</script>