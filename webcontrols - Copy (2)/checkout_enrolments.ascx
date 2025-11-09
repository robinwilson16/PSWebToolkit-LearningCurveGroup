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
<!--
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li id="linkParent" runat="server" CausesValidation="true"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian / Emergency</a></li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="linkQuals" runat="server" ><a id="aQuals" runat="server" href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare" runat="server"><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                    </ol>
    -->
<div class="progress" style="height: 20px;">
  <div class="progress-barlcg" role="progressbar" style="width: 12%;" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li><strong>Personal Details</strong></li>
                    <li>Guardian / Emergency</li>                   
                    <li>Further Details</li>
                     <li>Employment</li>
                    <li>Qualifications</li>
                       <li>Course Details</li>
                     <li>Declarations</li>
                    </ol>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    


<div class="container">
   <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <h2>Personal Details</h2><p>Please note all fields marked with <strong>*</strong> are required. </p>
          </div>
  </div>
  <div class="row" id="divRefno" runat="server" visible="false">
      <div class="col-sm-12 columns form-group"> 
    <h4>If you have already applied to the College or studied at the College as a student, your ID is <strong><asp:Label ID="lblRefno" runat="server"></asp:Label></strong> </h4>
          </div>
  </div>
    <div class="row">
    <div class="col-sm-6 columns form-group">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstName" runat="server" IsRequired="true"  CustomCaption="* Surname"/>
     </div>
        <div class="col-sm-6 columns form-group">       
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true"  CustomCaption="* First Name(s)"/>
     </div>
    </div>
  <div class="row">
      <div class="col-sm-6 columns form-group">            
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField7" runat="server" IsRequired="false"  CustomCaption="Middle name(s)"/>
          </div>
     
   </div>
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"  CustomCaption="* Date of birth"/>
          </div>
      <div class="col-sm-6 columns form-group">            
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
  <div class="row">
      <div class="col-sm-12 columns form-group"> 
<h4>Address details (where you will live while on this course)</h4>
            </div>
   </div>


    <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find your address, enter postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>
  <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          <cc1:StudentEnrolmentField runat="server" ID="txtAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" CustomCaption="* Address Line 1"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField runat="server" ID="txtAddress2" StudentEnrolmentFieldType="Address2" CustomCaption="Address Line 2"/>
          </div>
   </div>
  
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          <cc1:StudentEnrolmentField runat="server" ID="txtAddress3" StudentEnrolmentFieldType="Address3"  CustomCaption="Address Line 2"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField runat="server" ID="txtAddress4" StudentEnrolmentFieldType="Address4" CustomCaption="Address Line 4" />
          </div>
   </div>
    <div class="row">
         <div class="col-sm-3 columns form-group"> 
             <label for="postcode" style="font-weight:bold ">* Postcode</label><input runat="server" maxlength="9" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Your postcode here..." autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" />
             </div>
           
    </div>
      </div>
     <div class="row">
       <div class="col-sm-12 columns form-group">  <p><strong>You must provide at least one phone number below:</strong></p>
           </div>
         </div>
    <div class="row">
       <div class="col-sm-6 columns form-group"> 
  
   <cc1:StudentEnrolmentField CustomCaption="* Telephone No" StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField5" runat="server"  Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
            <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900">
Hover over me for Telephone format
</button>
           </div>
      <div class="col-sm-6 columns form-group"> 
             
           <cc1:StudentEnrolmentField CustomCaption="* Mobile No" StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server"  Pattern="^(07[\d]{8,12}|447[\d]{7,11})$"/>
       <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="bottom" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900">
Hover over me for Mobile format
</button>
          
      </div>
   </div>
      <div class="row">
        <div class="col-sm-12 columns form-group"> 
             <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true"  CustomCaption="* Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
            </div>
       </div>
      <div class="row">
          <div class="col-sm-12 columns form-group"> 
              <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HouseholdSituation1ID" ID="StudentEnrolmentField33" DefaultValue="99" runat="server" IsRequired="true"  ExcludedIDValues="98" LabelWidth="200" CustomCaption="* Your Household situation" />
          </div>
     </div>
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
                <p><strong>Learning Curve Group (LCG) is committed to supporting care leavers and 'looked after children' and therefore encourage candidates from these groups to study with us</strong>, we can also offer support and guidance to individuals from these groups from out student support and welfare teams.At LCG we deem a Care Leaver as any student who has spent 13 weeks or more in the care of the local authority (e.g. foster care or children’s home) between their 14th and 16th birthday, were privately fostered until the age of 16 or who were ‘looked after children’ until they were subject of a Special Guardianship Order.</p>
       </div>
     </div>
      <div class="row">
         <div class="col-sm-12 columns form-group">
             
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="StudentEnrolmentField16" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are a Care Leaver?"/>
          </div>
          </div>

     <div class="row">
         <div class="col-sm-4 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" runat="server" IsRequired="false" CustomCaption="Do you have an Educational Health Care Plan (EHCP)?" LabelWidth="320" />
          </div>
             </div>



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
    <br />

    </div>



      <!--  <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx"/> -->
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="checkout_parentguardian_aspx" CausesValidation="true" EnableEnterKey="true" />



