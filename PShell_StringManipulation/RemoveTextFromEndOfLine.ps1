<#
Remove text e.g. CreditNote from the end of each line

From:
    Invoice/cbc:ID
    CreditNote/cbc:IDCreditNote

    Invoice/cbc:IssueDate
    CreditNote/cbc:IssueDateCreditNote

    Invoice/cbc:InvoiceTypeCode
    CreditNote/cbc:CreditNoteTypeCodeCreditNote

To:

    Invoice/cbc:ID
    CreditNote/cbc:ID

    Invoice/cbc:IssueDate
    CreditNote/cbc:IssueDate

    Invoice/cbc:InvoiceTypeCode
    CreditNote/cbc:CreditNoteTypeCode
#>

$file = "Codes.txt"

# the $ at the end of CreditNote is an "end of line" anchor $ to say, "find any text called CreditNote that is at the end of a line and get rid of it".
@(Get-Content $file) -replace 'CreditNote$' | Set-Content $file

