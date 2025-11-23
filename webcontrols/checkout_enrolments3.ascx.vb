
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports System.Data
Imports System.Globalization

Partial Class webcontrols_checkout_enrolments
    Inherits CheckoutBaseControl

    Public CourseInformationID As Integer

    Public ReadOnly Property OfferingID() As Integer
        Get
            Return WorkingData.ShoppingCart.Items(0).OfferingID
        End Get
    End Property

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        CourseInformationID = CourseInformationHelper.GetCourseInformationID(Me.Session)

        PopulateOfferingFeeTable()

    End Sub


    Protected Sub PopulateOfferingFeeTable()

        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)
        Next
        Dim counter As Int16
        counter = 0
        If stb.Length > 0 Then

            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.IsROROColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            Me.GridOffering.DataSource = tblOffering
            Me.GridOffering.DataBind()

            Me.GridOffering.Visible = True

            Dim OfferingStartDate As String = Nothing
            Dim OfferingEndDate As String = Nothing

            For Each row As DataRow In tblOffering.Rows
                If row.Item("IsRORO") = "True" Then
                    counter = counter + 1
                Else
                    'Attempt to set dates from non-RoRo courses if set to pre-populate dates for enrolment request (below) - Robin Change
                    If IsNothing(OfferingStartDate) And Not IsNothing(row.Item("StartDate")) Then
                        OfferingStartDate = row.Item("StartDate")
                    End If

                    If IsNothing(OfferingEndDate) And Not IsNothing(row.Item("EndDate")) Then
                        OfferingEndDate = row.Item("EndDate")
                    End If
                End If

            Next row

            'Make dates visible and required whether RoRo or not and default to offering dates allowing amendment - Robin Change
            If Not IsNothing(WorkingData.EnrolmentRequestRow) Then
                If Not IsNothing(OfferingStartDate) Then
                    WorkingData.EnrolmentRequestRow.StartDate = OfferingStartDate
                End If

                If Not IsNothing(OfferingEndDate) Then
                    WorkingData.EnrolmentRequestRow.ExpectedEndDate = OfferingEndDate
                End If
            End If

            'Keep fields visible all the time - Robin Change
            If counter > 0 Then
                'startdate.Visible = True
                'startdate.IsRequired = True
                'enddate.IsRequired = True
                'enddate.Visible = True
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = "IsRoRo"
            Else
                'startdate.Visible = False
                'startdate.IsRequired = False
                'enddate.IsRequired = False
                'enddate.Visible = False

            End If
        End If



    End Sub


    Protected Sub GridOffering_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridOffering.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))
        End If
    End Sub

    Public Overrides Sub ValidateControl()


        If Not IsDate(WorkingData.EnrolmentRequestRow.StartDate) Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter a start date"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If Not IsDate(WorkingData.EnrolmentRequestRow.ExpectedEndDate) Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter an expected end date"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If WorkingData.EnrolmentRequestRow.StartDate > WorkingData.EnrolmentRequestRow.ExpectedEndDate Then
            Dim v As New CustomValidator
            v.ErrorMessage = "End date must not be before Start Date"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If


        MyBase.ValidateControl()
    End Sub

End Class
