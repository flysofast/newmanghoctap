<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTKB.ascx.cs" Inherits="MangHocTap.UC.ucTKB" %>
<link href="/CSS/ucTKB.css" rel="stylesheet" />
<script src="/Scripts/tooltip.js"></script>
<div style="border-spacing:2px;" id="TKB">
    <table class="tableData1" border="0" style="width: 100%;border-spacing:2px;">

        <tbody>
            <tr>
                <td class="rowHeader" align="center" style="width: 14%;">2</td>
                <td class="rowHeader" align="center" style="width: 14%;">3</td>
                <td class="rowHeader" align="center" style="width: 14%;">4</td>
                <td class="rowHeader" align="center" style="width: 14%;">5</td>
                <td class="rowHeader" align="center" style="width: 14%;">6</td>
                <td class="rowHeader" align="center" style="width: 14%;">7</td>
                <td class="rowHeader" align="center" style="width: 14%;">CN</td>
            </tr>
           
            <%GenerateTable(); %>
        </tbody>
    </table>
</div>
