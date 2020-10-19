<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="SO204000.aspx.cs" Inherits="Page_SO204000" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="AMCoontMarketplaceConfigurationActions" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" TypeName="AmazonIntegration.SOAmazonSetupMaint" PrimaryView="setupview">
        <CallbackCommands>
            <px:PXDSCallbackCommand Name="Insert" PostData="Self" />
            <px:PXDSCallbackCommand CommitChanges="True" Name="Save" />
            <px:PXDSCallbackCommand Name="First" PostData="Self" StartNewGroup="true" />
            <px:PXDSCallbackCommand Name="Last" PostData="Self" />
            <px:PXDSCallbackCommand Name="TestConnection" Visible="True" CommitChanges="true" />
        </CallbackCommands>
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="AMContMarketplaceConfiguration" ContentPlaceHolderID="phF" runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" DataMember="setupview" FilesIndicator="True" NoteIndicator="True"
        Width="100%" TabIndex="100">
        <Template>
            <px:PXLayoutRule runat="server" GroupCaption="Integration Settings" StartColumn="True" />
            <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="S" ControlSize="M"></px:PXLayoutRule>
            <px:PXSelector runat="server" ID="AMCstPXSelectorIntegrationID" DataField="IntegrationID" AutoRefresh="True"></px:PXSelector>
            <px:PXCheckBox ID="AMchkIsActiveStatus" CommitChanges="True" runat="server" DataField="Status" Width="90px" AlreadyLocalized="False"></px:PXCheckBox>
            <px:PXDropDown CommitChanges="True" runat="server" ID="AMCstPXDropDownIntegrationType" DataField="IntegrationType"></px:PXDropDown>
            <px:PXSegmentMask ID="AMCstPXSelectorCust" runat="server" AllowEdit="True" CommitChanges="True" DataField="GuestCustID">
            </px:PXSegmentMask>
            <px:PXSelector runat="server" ID="AMCstPXSelectorDfltWarehouse" DataField="DfltWarehouseID" CommitChanges="True" AllowEdit="True" edit="1"></px:PXSelector>
            <px:PXSelector runat="server" ID="AMCstPXSelectorOrderType" DataField="OrderType" CommitChanges="True" AutoRefresh="True" AllowEdit="True" edit="1"></px:PXSelector>
            <px:PXLayoutRule runat="server" ColumnSpan="2" />
            <px:PXTextEdit runat="server" ID="AMCstPXTextEditDesc" DataField="Description" AlreadyLocalized="False"></px:PXTextEdit>
            <px:PXLayoutRule StartColumn="True" runat="server" GroupCaption="Amazon API Settings" />
            <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="S" ControlSize="M"></px:PXLayoutRule>
            <px:PXTextEdit CommitChanges="True" runat="server" ID="AMCstPXTextEditSellerID" DataField="SellerId" AlreadyLocalized="False"></px:PXTextEdit>
            <px:PXTextEdit CommitChanges="True" runat="server" ID="AMCstPXTextEditAuthToken" DataField="AuthToken" TextMode="Password" AlreadyLocalized="False"></px:PXTextEdit>
            <px:PXTextEdit CommitChanges="True" runat="server" ID="AMCstPXTextEditAccessKey" DataField="AccessKey" TextMode="Password" AlreadyLocalized="False"></px:PXTextEdit>
            <px:PXTextEdit CommitChanges="True" runat="server" ID="AMCstPXTextEditSecretKey" DataField="SecretKey" TextMode="Password" AlreadyLocalized="False"></px:PXTextEdit>
            <px:PXTextEdit CommitChanges="True" runat="server" ID="AMCstPXTextEditMarketplaceID" DataField="MarketplaceId" AlreadyLocalized="False"></px:PXTextEdit>
            <px:PXLayoutRule StartColumn="True" ControlSize="L" LabelsWidth="XXS" runat="server" GroupCaption="FBM Note" />
            <px:PXTextEdit runat="server" DataField="FBMNote" SuppressLabel="True" ID="FBMNote" TextMode="MultiLine" Enabled="False" Height="75px" AlreadyLocalized="False"  />
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="AMContFieldMapping" ContentPlaceHolderID="phG" runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" Caption="Field Mapping Configuration" 
        CaptionVisible="true"
        Width="100%" SkinID="Details" AllowFilter="true" SyncPosition="true" KeepPosition="true" MatrixMode="true" >
        <Levels>
            <px:PXGridLevel DataMember="FieldMapping">
                <Columns>
                    <px:PXGridColumn CommitChanges="True" Type="CheckBox" DataField="IsActive" Width="60" TextAlign="Center"></px:PXGridColumn>
                    <px:PXGridColumn CommitChanges="True" Type="DropDownList" DataField="SourceObject" Width="200" ></px:PXGridColumn>
                    <px:PXGridColumn CommitChanges="True" Type="DropDownList" DataField="SourceField" Width="200" ></px:PXGridColumn>
                    <px:PXGridColumn CommitChanges="True" Type="DropDownList" DataField="TargetObject" Width="200"></px:PXGridColumn>
                    <px:PXGridColumn CommitChanges="True" Type="DropDownList" DataField="TargetField" Width="200" ></px:PXGridColumn>
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <AutoSize Container="Window" Enabled="true" MinHeight="450" />
        <Mode AllowUpload="true" InitNewRow="True" />
    </px:PXGrid>
</asp:Content>