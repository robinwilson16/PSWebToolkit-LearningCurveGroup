Imports CompassCC.CCCSystem.CCCCommon

Public Class CourseHelper
    Public Shared Function GetCourse(ByVal OfferingID As Integer) As OfferingRow
        Dim tblOffering1 As New OfferingDataTable
        Dim offeringRow As OfferingRow
        Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
        v.Columns.AddPKColumns()
        v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.AcademicYearIDColumn, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn, tblOffering1.CollegeLevelUserDefined1Column)
        v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, OfferingID)
        tblOffering1.TableAdapter.Load(tblOffering1, v)

        offeringRow = tblOffering1.Rows(0)

        Return offeringRow
    End Function
End Class