<%@ Control Language="VB" AutoEventWireup="false" CodeFile="coursedisplay.ascx.vb" Inherits="coursedisplay" Strict="false"  %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
    <%@ Import Namespace="CompassCC.CCCSystem.CCCCommon"%>

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="mt-3 mb-3 navbar bg-body-tertiary">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx"><i class="fa-solid fa-house"></i> Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"><i class="fa-solid fa-scroll"></i> Course Details</li>
        </ol>
    </div>
</nav>

<div class="progress mb-3" role="progressbar" aria-label="Online Enrolment Progress" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="height: 20px">
  <div class="progress-barlcg progress-bar-striped progress-bar-animated" style="width: 5%">5%</div>
</div>

<section>
    <h3>
        <asp:Label ID="lblCourseInfoTitle" runat="server"></asp:Label>

    </h3>
</section>

<div class="bd-callout bd-callout-lcg bd-callout-grey1 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> Course Information</h4>

    <asp:HyperLink runat="server" ID="btnPrintPDF" CssClass="btn btn-primary">
         <span class="glyphicon glyphicon-download-alt" style="padding-right:5px;"></span><span>Save as PDF</span>
    </asp:HyperLink>     
   
    <p>
        If you would like to Apply, Enrol or Enquire, please add the Course to your basket by 
        clicking on the appropriate icon. (If there is more than one course, 
        select the Course with the start date that suits you):
 </p>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
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
                <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
            </Columns>
            <RowStyle CssClass="searchgridcell" />
            <HeaderStyle CssClass="searchgridheader" />
            <EmptyDataTemplate>
                <p>No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.</p>
            </EmptyDataTemplate>
        </asp:GridView>
</div>   

<div class="alert alert-warning" role="alert">
    <div class="row">
        <div class="col-md-auto d-flex align-items-center">
            <h1><i class="fa-solid fa-sterling-sign"></i></h1>
        </div>
        <div class="col-md">
            <h4 class="alert-heading">Will I have to pay?</h4>
            <p>
                You will always have to pay the full fee when enroling online. You may be able to
        get a refund for all or part of the fees for your course if you are eligible. Please
        look at the following link for more information:
            </p>
            <p class="text-center">
                <a href="#" class="show_hide btn btn-warning">Will I have to pay fees?</a>
            </p>
            
        </div>
    </div>
</div>

    
<div class="slidingDiv">
    <p>
    If you are studying on a part-time course and you receive one of the following benefits, or you depend financially on someone who does, you are entitled to have your tuition fees waived: </p>
<ul>
<li>Job Seeker's Allowance </li>
<li>Income Support </li>
<li>Housing Benefit </li>
<li>Means-related Council Tax Rebate </li>
<li>Working Tax Credit (WTC)* </li>
<li>Pensions Guarantee Credit </li>
</ul>
<p>
You will, however, have to pay any awarding body/assessment fees (unless you are on a first full level 2 course).

* If you are in receipt of Working Tax Credit and you wish to claim concessionary rates please contact Customer Services who will be pleased to advise you on your entitlement. In addition, if you receive other allowances you may also be eligible to enrol at concessionary rates. If you are entitled to a fee concession you will be asked to provide proof of your entitlement.
</p>
<p>
It is essential that you inform us if your entitlement changes at any time during your course.

        </p>

</div>

<div class="bd-callout bd-callout-lcg bd-callout-grey2 mb-3">
    <h4><i class="fa-solid fa-square-caret-right"></i> More Information About This Course</h4>

    <cc1:KISWidget ID="KISWidget1" runat="server" Orientation="Horizontal" UKPRN="10003035" />

    <br />
    

<div id="ImageList" class="text-center">
    <asp:ListView ID="marketingimages" runat="server" CellSpacing="-1">
                <LayoutTemplate>
                    <ul class="MarketingFieldListView">
                        
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                        <div style="position: relative; display: inline-block;">
                             <asp:Imagebutton CssClass="MarketingField1Image" ID="btnMarketingGraphic" ImageUrl="#"  width="120px" Height="120px" runat="server" /><br >
                            <figcaption style="text-align: center; -ms-text-overflow: ellipsis; -o-text-overflow: ellipsis; text-overflow: ellipsis; overflow:hidden; width:130px">
                                <asp:Label ID="lblImage" runat="server"></asp:Label>
                            </figcaption>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:ListView>
</div>

    <asp:DataList ID="CourseInfoTextList" runat="server" Width="100%" ClientIDMode="static" CellSpacing="-1">
        <ItemTemplate>
       
            <asp:Label CssClass="lblCourseInfoTypeText" runat="server" Font-Bold="True" Text='<%# Eval("CourseInformationType") %>'></asp:Label>
            <br>
            <asp:Label CssClass="lblCourseInfoText" runat="server" Text='<%# Eval("InformationText") %>'></asp:Label>
            <br><br>    
       
        </ItemTemplate>
    </asp:DataList>

</div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  CssClass ="error"/>


<div class="alert alert-secondary" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-secondary btn-lg BackButton"><i class="fa-solid fa-circle-chevron-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back (Search for other courses)" ImageResource="btnBack" CausesValidation="false" LinkResource="search_aspx" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                
            </span>
        </div>
    </div>
</div>


<script type="text/javascript">
    
    $(document).ready(function () {
        // Hide & show details on fees (without popping the browser window to the top on each click!)
        $(".slidingDiv").hide();
        $(".show_hide").show();

        $('.show_hide').click(function (e) {
            $(".slidingDiv").slideToggle();
            e.preventDefault(); 
        });
        // End hide & show

 
    });

    
   
</script>
