<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolments3.ascx.vb" Inherits="webcontrols_checkout_enrolments" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<div class="progress" style="height: 20px;">
  <div class="progress-barlcg" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li>Further Details</li>
                    <li>Employment</li>
                    <li>Qualifications</li>
                    <li><strong>Course Details</strong></li>
                    <li>Declarations</li>
                    </ol>

  
<div class="container">
  <div class="row">
      <div class="col-sm-12 columns form-group"> 
       <h2>Course Details</h2> 
          </div>
  </div>

    <div class="application-form__form-wrapper">
    <asp:GridView ID="GridOffering" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Course Name">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="SiteDescription" HeaderText="Site" />
             <asp:BoundField DataField="IsRORO" HeaderText="RoRo" />
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="false">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
        </Columns>
        <RowStyle CssClass="searchgridcell" />
        <HeaderStyle CssClass="searchgridheader" />
        <EmptyDataTemplate>
            <p>
                No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.
            </p>
        </EmptyDataTemplate>
    </asp:GridView>
</div>

    <div class="row">

         <div class="col-sm-3 columns form-group">            
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StartDate" ID="startdate" runat="server" IsRequired="false" LabelWidth="350" CustomCaption="Start Date (roll on roll off course)"/>
          </div>
    </div>
</div>

        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_quals_on_entry_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="checkout_dataprotection_aspx" CausesValidation="true" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
