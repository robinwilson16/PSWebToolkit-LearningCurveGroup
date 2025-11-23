<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolments3.ascx.vb" Inherits="webcontrols_checkout_enrolments" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
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
            <li class="breadcrumb-item"><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx"><i class="fa-solid fa-award"></i> Qualifications</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-hourglass-start"></i> Course Dates</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 70%">70%</div>
</div>
  
<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Course Details</h4>


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
</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Learner Enrolment Dates</h4>
    <div class="row">

         <div class="col-sm-3 columns form-group">            
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StartDate" ID="startdate" runat="server" IsRequired="false" LabelWidth="350" CustomCaption="Start Date (for learner)" HTML5InputType="date" />
          </div>
         <div class="col-sm-3 columns form-group">            
     		<cc1:StudentEnrolmentField StudentEnrolmentFieldType="ExpectedEndDate" ID="enddate" runat="server" IsRequired="false"  LabelWidth="350" CustomCaption="Expected End Date (for learner)" HTML5InputType="date" />
          </div>
    </div>
</div>
   
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" LinkResource="checkout_quals_on_entry_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lcg btn-lg NextButton">Next <i class="fa-solid fa-circle-chevron-right"></i></button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="Request" LinkResource="checkout_enrolments4_aspx" />
            </span>
        </div>
    </div>
</div>