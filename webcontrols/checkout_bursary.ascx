<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_bursary.ascx.vb" Inherits="checkout_bursary" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>


<asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />
<div class="container">
    <div class="panel panel-primarylcg">
 
            <h2>16-19 BURSARY AND FREE MEALS APPLICATION FORM</h2>
             <p>Please note LCG can only backdate payments four weeks from when application is received.</p>
    </div>
    </div>  
<div class="container">
    <div class="panel panel-primarylcg">
    

         <div class="panel-headinglcg" id="dec">Your details</div>

         <div class="row">
            <div class="col-sm-12 columns form-group"> 
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="fldrefno" runat="server" IsRequired="True"  LabelWidth="400" CustomCaption="Student Reference Number" />
            </div>
          </div>



         <div class="row">
            <div class="col-sm-12 columns form-group"> 
            <span class="textfieldlabelrequired">* Are you an Asylum Seeker?</span>
              <p>Note: LCG cannot make cash payments to asylum seekers.</p>
                 <asp:DropDownList ID="ddlAsylum" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="Yes">Yes</asp:ListItem>
                <asp:ListItem value="No">No</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>

             <div class="row">
            <div class="col-sm-12 columns form-group"> 
            <span class="textfieldlabelrequired">* Do you live?</span>
                 <asp:DropDownList ID="ddlLive" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="Parents">With parents</asp:ListItem>
                <asp:ListItem value="Guardians">With guardian(s)</asp:ListItem>
                <asp:ListItem value="Alone">Alone</asp:ListItem>
                <asp:ListItem value="Other">Other</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>
 </div>
    <div class="panel panel-primarylcg">
        <div class="panel-headinglcg" >Eligibility for bursary for defined vulnerable groups</div>


          <div class="row">
            <div class="col-sm-12 columns form-group"> 
                  <span class="textfieldlabelrequired">* Are you?</span>
                   <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkInCare" runat="Server" Text="Currently in care?" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkCareLeaver" runat="Server" Text="A care leaver?" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="checkISorUC" runat="Server" Text="Receiving Income Support (IS), or Universal Credit (UC) because you are financially supporting yourself or financially supporting yourself and someone who is dependent on you and living with you such as a child or partner?" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkDLAorPIP" runat="Server" Text="Receiving Disability Living Allowance (DLA) or Personal Independence Payments (PIP) in your own right as well as Employment and Support Allowance (ESA) or UC in your own right" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    </div>
            </div>
        </div>
</div>
 <div class="panel panel-primarylcg">
     <div class="panel-headinglcg" >Eligibility for free meals in further education</div>

        <p>To be completed by the parent/guardian (or the learner if they live alone)</p>
        <p><i>You will need to evidence this on the ‘Evidence of Eligibility - Upload’ page</i></p>
          <div class="row">
            <div class="col-sm-12 columns form-group"> 
                  <span class="textfieldlabelrequired">* Please tick as appropriate if the learner, or their parents/guardians, are in receipt of any of the below benefits:</span>
                     <div class="checkbox checkboxlist">
                    <asp:CheckBox id="chkIncomeSuport" runat="Server" Text="Income Support" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkIncomeJSA" runat="Server" Text="Income-based Jobseekers Allowance" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkIncomeESA" runat="Server" Text="Income-related Employment and Support Allowance (ESA)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkAsylum" runat="Server" Text="Support under part VI of the Immigration and Asylum Act 1999" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkStatePen" runat="Server" Text="The guarantee element of State Pension Credit" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkChildTax" runat="Server" Text="Child Tax Credit (provided they are not entitled to Working Tax Credit and have an annual gross income of no more than £16,190, as assessed by Her Majesty’s Revenue and Customs (HMRC))" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkWTC" runat="Server" Text="Working Tax Credit run-on (paid for 4 weeks after someone stops qualifying for Working Tax Credit) Working Tax Credit run-on (paid for 4 weeks after someone stops qualifying for Working Tax Credit)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    <asp:CheckBox id="chkUC" runat="Server" Text="Universal Credit with net earnings not exceeding the equivalent of £7,400 pa (after tax and not including any benefits you get)" CssClass="checkbox-inline" ></asp:CheckBox><br />
                    </div>
            </div>
        </div>

          <div class="row">
            <div class="col-sm-12 columns form-group"> 
                  <p>Learners aged 19 years old are also eligible for free meals if they have an Education, Health
    and Care Plan (EHCP)</p>
                     <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" ID="StudentEnrolmentField1" runat="server" LabelWidth="400" CustomCaption="Do you have an EHCP?" />
      
            </div>
        </div>
</div>
 <div class="panel panel-primarylcg">
     <div class="panel-headinglcg" >Household Income</div>

        <p><i>To be completed by the parent/guardian (or the learner if they live alone)</i></p>

          <div class="row">
            <div class="col-sm-12 columns form-group"> 
            <span class="textfieldlabelrequired">* Is the total gross annual income for your household below £30,000?</span>
                 <asp:DropDownList ID="ddlIncome" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="Yes">Yes</asp:ListItem>
                <asp:ListItem value="No">No</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>
        <p>Please state gross annual income below:</p>
         <div class="row">
            <div class="col-sm-3 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined3" CustomFieldType="NumberWithDecimals" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Adult 1"  />
            </div>
             <div class="col-sm-3 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined4" CustomFieldType="NumberWithDecimals" ID="StudentEnrolmentField4" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Adult 2" />
            </div>
         </div>
        <p><i>You will need to evidence this on the ‘Evidence of Eligibility - Upload’ page</i></p>
    </div>
    <div class="panel panel-primarylcg">
     <div class="panel-headinglcg" >Financial Support</div>
        <p><i>To be completed by the parent/guardian (or the learner if they live alone)</i></p>

          <div class="row">
                <div class="col-sm-6 columns form-group"> 
                    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined5" ID="StudentEnrolmentField5" runat="server" CustomFieldType="NumberWithDecimals"  IsRequired="false" LabelWidth="450" CustomCaption="Travel -  please state the weekly cost of travel to the centre for learning" />
             </div>
                <div class="col-sm-6 columns form-group"> 
                    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined6" ID="StudentEnrolmentField35" runat="server" CustomFieldType="NumberWithDecimals"  IsRequired="false" LabelWidth="450" CustomCaption="Financial support for Equipment -  please state the cost of equipment" />
             </div>
          </div>

          <div class="row">
            <div class="col-sm-12 columns form-group"> 
            <span class="textfieldlabelrequired">* Do you require support with uniform?</span>
                 <asp:DropDownList ID="ddUniform" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                <asp:ListItem value="No">No</asp:ListItem>
                     <asp:ListItem value="Yes - Military Uniform">Yes - Military Uniform</asp:ListItem>
                     <asp:ListItem value="Yes - Hair & Beauty Uniform">Yes - Hair & Beauty Uniform</asp:ListItem>
                     <asp:ListItem value="Yes - Construction Uniform">Yes - Construction Uniform</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>
        <div id="military-uniformFields">
          <div class="row">
            <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Top Size</span>
                 <asp:DropDownList ID="ddMilitaryTopSize" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                <asp:ListItem value="S">S</asp:ListItem>
                     <asp:ListItem value="M">M</asp:ListItem>
                     <asp:ListItem value="L">L</asp:ListItem>
                     <asp:ListItem value="XL">XL</asp:ListItem>
                      <asp:ListItem value="XXL">XXL</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Waist Size</span>
                 <asp:DropDownList ID="ddMilitaryWaist" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                <asp:ListItem value="22">22</asp:ListItem>
                     <asp:ListItem value="24">24</asp:ListItem>
                     <asp:ListItem value="26">26</asp:ListItem>
                     <asp:ListItem value="28">28</asp:ListItem>
                     <asp:ListItem value="30">30</asp:ListItem>
                     <asp:ListItem value="32">32</asp:ListItem>
                     <asp:ListItem value="34">34</asp:ListItem>
                     <asp:ListItem value="36">36</asp:ListItem>
                     <asp:ListItem value="38">38</asp:ListItem>
                     <asp:ListItem value="40">40</asp:ListItem>
                     <asp:ListItem value="42">42</asp:ListItem>
                     <asp:ListItem value="44">44</asp:ListItem>
                     <asp:ListItem value="46">46</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Boot Size</span>
                 <asp:DropDownList ID="ddMilitaryBoot" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="3">3</asp:ListItem>
                     <asp:ListItem value="4">4</asp:ListItem>
                     <asp:ListItem value="5">5</asp:ListItem>
                      <asp:ListItem value="6">6</asp:ListItem>
                     <asp:ListItem value="7">7</asp:ListItem>
                     <asp:ListItem value="8">8</asp:ListItem>
                     <asp:ListItem value="9">9</asp:ListItem>

                     <asp:ListItem value="10">10</asp:ListItem>
                     <asp:ListItem value="11">11</asp:ListItem>
                     <asp:ListItem value="12">12</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Bib Colour</span>
                 <asp:DropDownList ID="ddMilitaryBib" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="Green">Green</asp:ListItem>
                     <asp:ListItem value="Red">Red</asp:ListItem>
                     <asp:ListItem value="Blue">Blue</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>
        </div>
         <div id="hair-beauty-uniformFields">
          <div class="row">
            <div class="col-sm-2 columns form-group"> 
            <span class="textfieldlabelrequired">* Tunic Size</span>
                 <asp:DropDownList ID="ddBeautyTunic" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="4">4</asp:ListItem>
                     <asp:ListItem value="6">6</asp:ListItem>
                     <asp:ListItem value="8">8</asp:ListItem>
                     <asp:ListItem value="10">10</asp:ListItem>
                     <asp:ListItem value="12">12</asp:ListItem>
                     <asp:ListItem value="14">14</asp:ListItem>
                     <asp:ListItem value="16">16</asp:ListItem>
                     <asp:ListItem value="18">18</asp:ListItem>
                     <asp:ListItem value="20">20</asp:ListItem>
                     <asp:ListItem value="22">22</asp:ListItem>
                     <asp:ListItem value="24">24</asp:ListItem>
                     <asp:ListItem value="26">26</asp:ListItem>
                     <asp:ListItem value="28">28</asp:ListItem>
                     <asp:ListItem value="30">30</asp:ListItem>
                     <asp:ListItem value="32">32</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-2 columns form-group"> 
            <span class="textfieldlabelrequired">* Trouser Size</span>
                 <asp:DropDownList ID="ddBeautyTrousers" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="4">4</asp:ListItem>
                     <asp:ListItem value="6">6</asp:ListItem>
                     <asp:ListItem value="8">8</asp:ListItem>
                     <asp:ListItem value="10">10</asp:ListItem>
                     <asp:ListItem value="12">12</asp:ListItem>
                     <asp:ListItem value="14">14</asp:ListItem>
                     <asp:ListItem value="16">16</asp:ListItem>
                     <asp:ListItem value="18">18</asp:ListItem>
                     <asp:ListItem value="20">20</asp:ListItem>
                     <asp:ListItem value="22">22</asp:ListItem>
                     <asp:ListItem value="24">24</asp:ListItem>
                     <asp:ListItem value="26">26</asp:ListItem>
                     <asp:ListItem value="28">28</asp:ListItem>
                     <asp:ListItem value="30">30</asp:ListItem>
                     <asp:ListItem value="32">32</asp:ListItem>
                 </asp:DropDownList>
            </div>
              <div class="col-sm-2 columns form-group"> 
            <span class="textfieldlabelrequired">* Dress Size</span>
                 <asp:DropDownList ID="ddBeautyDress" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="4">4</asp:ListItem>
                     <asp:ListItem value="6">6</asp:ListItem>
                     <asp:ListItem value="8">8</asp:ListItem>
                     <asp:ListItem value="10">10</asp:ListItem>
                     <asp:ListItem value="12">12</asp:ListItem>
                     <asp:ListItem value="14">14</asp:ListItem>
                     <asp:ListItem value="16">16</asp:ListItem>
                     <asp:ListItem value="18">18</asp:ListItem>
                     <asp:ListItem value="20">20</asp:ListItem>
                     <asp:ListItem value="22">22</asp:ListItem>
                     <asp:ListItem value="24">24</asp:ListItem>
                     <asp:ListItem value="26">26</asp:ListItem>
                     <asp:ListItem value="28">28</asp:ListItem>
                     <asp:ListItem value="30">30</asp:ListItem>
                     <asp:ListItem value="32">32</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-2 columns form-group"> 
            <span class="textfieldlabelrequired">* T-Shirt Size</span>
                 <asp:DropDownList ID="ddBeautyTshirt" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="4">4</asp:ListItem>
                     <asp:ListItem value="6">6</asp:ListItem>
                     <asp:ListItem value="8">8</asp:ListItem>
                     <asp:ListItem value="10">10</asp:ListItem>
                     <asp:ListItem value="12">12</asp:ListItem>
                     <asp:ListItem value="14">14</asp:ListItem>
                     <asp:ListItem value="16">16</asp:ListItem>
                     <asp:ListItem value="18">18</asp:ListItem>
                     <asp:ListItem value="20">20</asp:ListItem>
                     <asp:ListItem value="22">22</asp:ListItem>
                     <asp:ListItem value="24">24</asp:ListItem>
                     <asp:ListItem value="26">26</asp:ListItem>
                     <asp:ListItem value="28">28</asp:ListItem>
                     <asp:ListItem value="30">30</asp:ListItem>
                     <asp:ListItem value="32">32</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Toolkit Type</span>
                 <asp:DropDownList ID="ddBeautyToolkit" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="Beauty">Beauty</asp:ListItem>
                     <asp:ListItem value="Nail Technology">Nail Technology</asp:ListItem>
                     <asp:ListItem value="Make-up">Make-up</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>
        </div>
        <div id="construction-uniformFields">
          <div class="row">
            <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Top Size</span>
                 <asp:DropDownList ID="ddConstructionTop" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                <asp:ListItem value="S">S</asp:ListItem>
                     <asp:ListItem value="M">M</asp:ListItem>
                     <asp:ListItem value="L">L</asp:ListItem>
                     <asp:ListItem value="XL">XL</asp:ListItem>
                      <asp:ListItem value="XXL">XXL</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-3 columns form-group"> 
            <span class="textfieldlabelrequired">* Waist Size</span>
                 <asp:DropDownList ID="ddConstructionWaist" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                <asp:ListItem value="22">22</asp:ListItem>
                     <asp:ListItem value="24">24</asp:ListItem>
                     <asp:ListItem value="26">26</asp:ListItem>
                     <asp:ListItem value="28">28</asp:ListItem>
                      <asp:ListItem value="30">30</asp:ListItem>
                     <asp:ListItem value="32">32</asp:ListItem>
                     <asp:ListItem value="34">34</asp:ListItem>
                     <asp:ListItem value="36">36</asp:ListItem>
                     <asp:ListItem value="38">38</asp:ListItem>
                     <asp:ListItem value="40">40</asp:ListItem>
                     <asp:ListItem value="42">42</asp:ListItem>
                     <asp:ListItem value="44">44</asp:ListItem>
                     <asp:ListItem value="46">46</asp:ListItem>
                 </asp:DropDownList>
            </div>
                       <div class="col-sm-4 columns form-group"> 
            <span class="textfieldlabelrequired">* Toolkit Type</span>
                 <asp:DropDownList ID="ddConstructionToolkit" runat="server"   CssClass="textfield form-control" EnableViewState="true">
                 <asp:ListItem value="">Please select...</asp:ListItem>
                     <asp:ListItem value="Bricklaying">Bricklaying</asp:ListItem>
                     <asp:ListItem value="Carpentry & Joinery">Carpentry & Joinery</asp:ListItem>
                     <asp:ListItem value="Plastering">Plastering</asp:ListItem>
                     <asp:ListItem value="Painting & Decorating">Painting & Decorating</asp:ListItem>
                     <asp:ListItem value="Multi-skills">Multi-skills</asp:ListItem>
                     
                 </asp:DropDownList>
            </div>

        </div>
        </div>
        <p>Please use this box to detail what other financial support is required where applicable (e.g. other course related costs)</p>
              <div class="row">
                <div class="col-sm-12 columns form-group"> 
                    <asp:TextBox  ID="notes" TextMode="MultiLine" Rows="10" runat="server" Width="100%" Height="100%" IsRequired="false" LabelWidth="400" CustomCaption="Other financial support:" />
        
                    </div>
          </div>

    </div>

     <div class="panel panel-primarylcg">
         <div class="panel-headinglcg" >Bank details</div>



            <h5>To be able to provide you with the financial support from the bursary fund, we will need your bank details.</h5>

            <h5><b>Please make sure the details you enter are correct as we cannot be held accountable for incorrect details entered.</b></h5>
            <%--  
                 <div class="form-group">

                        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="" ID="BankName" runat="server" IsRequired="true"  LabelWidth="400" CustomCaption="Bank Name" CustomFieldType="Text" />
           </div>--%>

            <div class="form-group">

                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined7" ID="SortCode" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="Sort Code (Include dashes (XX-XX-XX))" CustomFieldType="Text" Pattern="^(\d){2}-(\d){2}-(\d){2}$" Title="Please enter a valid Sort Code - Include dashes (XX-XX-XX)" />
            </div>
            <div class="form-group">

                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined8" ID="AccNo" runat="server" IsRequired="true" LabelWidth="450" CustomCaption="Account Number (8 digits no spaces or add 0 in front of 7 digit accounts)" CustomFieldType="Text" Pattern="^(\d){8}$" Title="Please enter a valid account number(8 digits no spaces) For 7 Digit account numbers, add a 0 at the beginning" />
            </div>
            <div class="form-group">

                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined9" ID="HolderName" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="Account Holder Name" CustomFieldType="Text" />
            </div>
            <div class="form-group">

                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined10" ID="StudentEnrolmentField16" runat="server" IsRequired="False" LabelWidth="400" CustomCaption="Roll number (if applicable)" CustomFieldType="Text" />
            </div>
        </div>
    


    <div class="panel panel-primarylcg">
         <div class="panel-headinglcg" >Evidence of Eligibility - Upload</div>

    <h5>For us to assess your eligibility you now need to upload evidence relating to your personal status and household income</h5>
    <br />
    <h5>You can do this by taking a photo or scan of each item of evidence and uploading it below. Please note you may be required to provide copies of the original documents in person at a later date. 

    </h5>
    <br />
    <h5>For each item of evidence, select the most relevant ‘type of evidence’, enter any additional notes if required, and then pick the Browse button and pick the item of evidence for upload. <b>Remember to click the ‘Upload’ button for each item of evidence.</b>
    </h5>
    <br />
    <h3>What do I need to upload? </h3>


    <div class="application-form__form-wrapper">

        <p>To evidence your eligibility see below:</p>
        <table class="table table-striped table-bordered">
            <tr class="active">
                <th>Option</th>
                <th>Evidence to Upload</th>
                <tr>
                    <td>I am 16-18 and in Care</td>
                    <td>Please provide a letter from the Local Authority / Social Services to confirm this</td>
                </tr>
            <tr>
                <td>I am 16-18 and I am a Care Leaver</td>
                <td>Please provide a letter from the Local Authority / Social Services to confirm this
                </td>

            </tr>
            <tr>
                <td>I am aged 16-18 and receive Income Support or Universal Credit in my own name</td>
                <td>Please provide a copy of your award notice
                </td>

            </tr>
            <tr>
                <td>I am aged 16-18 and receive Disability Living Allowance or Personal Independence Payments AND Employment & Support Allowance</td>
                <td>Please provide your DSA or PIP and ESA award notice</td>

            </tr>
            <tr>
                <td>I am aged 16-18 (or 19-24 with an EHCP) and have a total household income of less than £30,000</td>
                <td>Please provide evidence of household income</td>

            </tr>
           <!--
 <tr>
                <td>I am aged 19 or over and have a total household income of less than £30,000</td>
                <td>Please provide evidence of household income
                </td>

            </tr>
            <tr>

                <td>I am aged 19 or over and have a total household income of less than £30,000 AND I am paying for my course with an Advanced Learning Loan
                </td>
                <td>Please provide evidence of household income and evidence of your loan confirmation
                </td>


            </tr>
-->

        </table>
    </div>
    <div class="application-form__form-wrapper">

        <h3>To evidence your household income – <i>you must upload evidence for all types of income that apply</i></h3>
        <table class="table table-striped table-bordered">
            <tr class="active">
                <th>Type of Income</th>
                <th>Evidence to Upload</th>
                <tr>
                    <td>Salary/wages from paid employment</td>
                    <td>Please provide last 3 months wage slips or P60</td>
                </tr>
            <tr>
                <td>Self-employed earnings</td>
                <td>Please provide audited accounts for most recent tax year or official tax return
                </td>

            </tr>
            <tr>
                <td>Income Support</td>
                <td>Please provide an award letter which is less than 3 months old or a recent bank statement which names the benefit that is received
                </td>

            </tr>
            <tr>
                <td>Universal Credit</td>
                <td>Please provide an award letter which is less than 3 months old or a recent bank statement which names the benefit that is received</td>

            </tr>
            <tr>
                <td>Employment & Support Allowance</td>
                <td>Please provide an award letter which is less than 3 months old or a recent bank statement which names the benefit that is received</td>

            </tr>
            <tr>
                <td>Pension Credit</td>
                <td>Please provide an award letter which is less than 3 months old or a recent bank statement which names the benefit that is received</td>

            </tr>
            <tr>

                <td>Working Tax Credit / Child Tax Credit</td>
                <td>Please provide all pages of the latest Tax Credit Award</td>


            </tr>
            <tr>

                <td>Company or Private Pension
                </td>
                <td>Please provide the annual pension statement or a recent bank statement which includes pension amounts

                </td>
            </tr>
            <tr>

                <td>Support under part VI of the Immigration and Asylum Act 1999
                </td>
                <td>Please provide a copy of your award letter

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
     
        <%#: Eval("TypeOfEvidence") %>
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

     <div class="panel panel-primarylcg" id="declares" runat="server">
         <div class="panel-headinglcg" >Declaration</div>


      
<p>I CONFIRM THAT THE INFORMATION GIVEN ON THIS FORM IS CORRECT AND COMPLETE TO THE BEST OF MY
KNOWLEDGE. I UNDERSTAND THAT LEARNING CURVE GROUP HAVE THE RIGHT TO MAKE AN INDEPENDENT CHECK
OF ANY EVIDENCE PRODUCED AND SUCH ACTION IS DEEMED APPROPRIATE IN THE EVENT OF ANY INFORMATION I
HAVE GIVEN BEING PROVEN TO BE INCORRECT OR FALSE. I UNDERSTAND ALL PAYMENTS ARE SUBJECT TO CONDITIONS SET OUT IN THE STUDENT SUPPORT POLICY.</p>
 

    <div class="form-group">

        <asp:CheckBox ID="chkConfirm" runat="server"
            Text="I agree to the declaration as stated above" Font-Bold="True"
            CausesValidation="True" />

        <%--                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined34" ID="StudentEnrolmentField17" runat="server" IsRequired="True"  LabelWidth="400" CustomCaption="I agree to the declaration as stated above" />--%>
    </div>

    </div>
   <hr />

         <div class="form-group">
             <h3>What happens next?</h3>
    </div>
        <div class="form-group">
            <ul>
                <li>We will aim to process your application within 10 working days from the date we receive it </li>
                <li>If you have not answered all of the questions or you have not provided evidence of your household income / personal circumstances, then your application will not be assessed. We will write to you to advise what information or evidence you need to provide
                </li>
                <li>When we have assessed your application we will write to you to explain what you have been awarded and how your award will be paid</li>
                <li>If your application is unsuccessful we will send you a letter explaining why which will include details of how you can appeal the decision.</li>

            </ul>
            </div>

        
</div>

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

<script type="text/javascript">
    $("#btnChooseFile").click(function () {
        $('#fuAttachment').click();
    });
    function confirmDeletion() {
        var result = confirm("Are you sure you want to delete this attachment? Press OK to continue deletion.");
        if (result) {
            return true;
        }
        return false;
    }    
</script>
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

    
    <script type="text/javascript">
        $(document).ready(function () {


            $("#military-uniformFields").hide();
            $("#hair-beauty-uniformFields").hide();
            $("#construction-uniformFields").hide();
            if ($("#<%=ddUniform.ClientID%>").val() == "Yes - Military Uniform") {
                $("#military-uniformFields").show();
               
            }
            if ($("#<%=ddUniform.ClientID%>").val() == "Yes - Hair & Beauty Uniform") {
                $("#hair-beauty-uniformFields").show();

            }
            $('#<%= ddUniform.ClientID %>').change(function () {
                // $('#cboEuroResidentID').checked=false;
                if ($("#<%=ddUniform.ClientID%>").val() == "Yes - Military Uniform") {
                    $("#military-uniformFields").show();
                    $("#hair-beauty-uniformFields").hide();
                    $("#construction-uniformFields").hide();

                     return;    
                }

                if ($("#<%=ddUniform.ClientID%>").val() == "Yes - Hair & Beauty Uniform") {
                    $("#hair-beauty-uniformFields").show();
                    $("#military-uniformFields").hide();
                    $("#construction-uniformFields").hide();

                    return;
                }

                if ($("#<%=ddUniform.ClientID%>").val() == "Yes - Construction Uniform") {
                    $("#hair-beauty-uniformFields").hide();
                    $("#military-uniformFields").hide();
                    $("#construction-uniformFields").show();

                    return;
                }

                else {
                    $("#military-uniformFields").hide();
                    $("#hair-beauty-uniformFields").hide();
                    $("#construction-uniformFields").hide();              }
            });



        });
    </script>