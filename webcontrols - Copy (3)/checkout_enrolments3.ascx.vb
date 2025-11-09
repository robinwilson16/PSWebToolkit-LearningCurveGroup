
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports System.Data

Partial Class webcontrols_checkout_enrolments
    Inherits CheckoutBaseControl

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)


        PopulateOfferingFeeTable()

    End Sub

    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)
        Next
        Dim counter As Int16
        counter = 0
        If stb.Length > 0 Then
            'Load offerings
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
            For Each row As DataRow In tblOffering.Rows
                If row.Item("IsRORO") = "True" Then
                    counter = counter + 1
                End If
                'Do something to print this Row
            Next row
            If counter > 0 Then
                startdate.Visible = True
                startdate.IsRequired = True
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = "IsRoRo"
            Else
                startdate.Visible = False
                startdate.IsRequired = False
                ' WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = "IsRoRo"
            End If
        End If



    End Sub

    ''Databind the Grid
    Protected Sub GridOffering_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridOffering.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))
        End If
    End Sub

    Public Overrides Sub ValidateControl()


        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = "IsRoRo" And Not IsDate(WorkingData.EnrolmentRequestRow.StartDate) Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter a start date"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If


        MyBase.ValidateControl()
    End Sub

End Class
