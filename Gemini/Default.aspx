<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="Styles/Default.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <asp:ScriptManager ID="SM1" runat="server" />
    <script type="text/javascript">
        function confirm() {
            
            $('#Quote').animate({ 'opacity': '0', 'height':'0px' }, 300, 'easeInBack');
            $('#CONFIRM').animate({ 'width':'300px', 'height':'50px','opacity': '1' }, 500, 'easeOutBack');
        }
        $(document).ready(function () {
            $('.content img').bind('mouseenter', function () {
                $(this).stop(true).animate({ 'width': '225px', 'height': '225px' }, 200, 'linear');
            }).bind('click', function () {
                $(this).stop(true).animate({ 'height':'0px', 'width':'0px','opacity': '0' }, 500, 'easeInQuad')
                    .andSelf().parent().find('.wrap').animate({
                        'width': ($('.content').width() * 1) + 'px',
                        'height': ($('.content').height() * 1) + 'px',
                        'opacity': '1'
                    }, 500, 'easeOutQuad');
            });
            
            $('.content').bind('mouseleave', function () {
                $(this).find('img').animate(
                    {
                        'width': '200px',
                        'height': '200px'
                    }, 200, 'linear');
            });

            $('.content .wrap').bind('mouseleave', function () {
                $(this).animate({
                    'height': '0px',
                    'width': '0px',
                    'opacity': '0'
                }, 500, 'easeInBack')
                .andSelf().parent().find('img').animate({ 'opacity':'1', 'width':'200px', 'height':'200px'}, 500, 'easeOutQuad');
            });
        });
        
    </script>
    <div id="parent">
        <div id="TOP">
            <div id="PARENT">
                <div id="LEFT">
                    <h1>Bring those bright ideas to life!</h1>
                    <h2>We want to make your vision a reality</h2>
                    
                    <div id="Quote">
                        <asp:UpdatePanel ID="UP1" runat="server">
                            <ContentTemplate>
                                <span class="headline">Get your free quote today!</span>
                                <asp:Label ID="Label1" runat="server" Text="Name:" CssClass="label" />
                                <asp:RequiredFieldValidator ID="ReqName" runat="server" ControlToValidate="txtName" ErrorMessage="*" CssClass="error" />
                                <asp:TextBox ID="txtName" runat="server" CssClass="textbox" /><br />
                                <asp:Label ID="Label2" runat="server" Text="Email" CssClass="label" />
                                <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" CssClass="error" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" /><br />
                                <asp:Label ID="Label3" runat="server" CssClass="label" Text="I Need:" />
                                <asp:RequiredFieldValidator ID="reqType" runat="server" ControlToValidate="DDL1" ErrorMessage="*" CssClass="error" />
                                <asp:DropDownList ID="DDL1" Width="202" runat="server" AutoPostBack="false"  CssClass="textbox">
                                    <asp:ListItem Text="" Enabled="true" Selected="True" Value="None" />
                                    <asp:ListItem Text="A Basic Website" Enabled="true" Selected="False" Value="Basic" />
                                    <asp:ListItem Text="A Custom Website" Enabled="true" Selected="False" Value="CustomWeb" />
                                    <asp:ListItem Text="Database Development" Enabled="true" Selected="False" Value="Database" />
                                    <asp:ListItem Text="Application Development" Enabled="true" Selected="False" Value="Applications" />
                                    <asp:ListItem Text="Technical Support" Enabled="true" Selected="False" Value="Technical" />
                                    <asp:ListItem Text="Other" Enabled="true" Selected="False" Value="Other" />
                                </asp:DropDownList><br />
                                <asp:Label ID="Label4" CssClass="label" runat="server" Text="Project Details:" /><br />
                                <asp:RequiredFieldValidator ID="reqDeets" runat="server" ErrorMessage="*" ControlToValidate="txtDetails" CssClass="error" />
                                <asp:TextBox ID="txtDetails" CssClass="textbox" Height="100" TextMode="MultiLine" runat="server" /><br />
                                <asp:Button ID="btnGetQuote" runat="server" Text="Submit" CssClass="bigButt" OnClick="btnGetQuote_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="CONFIRM">
                        Thank you for submitting your request! We will contact you once we've had a chance to review your requirements.
                    </div>
                </div>
                <div id="RIGHT">
                    <img src="Images/tech1.png" alt="it's techy" />
                </div>
            </div>
        </div>
        <div id="MIDDLE">
            <div class="head">
                <h1>Have a problem?</h1><br />
                <h2>our solutions are tailor-made just for you</h2>
            </div>
            <div class="showcase">
                <div class="item">
                    <div class="content">
                        <span class="head">Custom Designs</span>
                        <div class="wrap">
                            <div class="box">
                                We bring you a unique design experience by 
                                assessing your needs and personally designing
                                and creating graphics, layouts, and effects to 
                                make your website truly one of a kind.
                            </div>
                        </div>
                        <img src="Images/computerSphere.png" alt="such computer" />
                    </div>
                </div>
                <div class="item">
                    <div class="content">
                        <span class="head">Front, Middle, & Back</span>
                        <div class="wrap">
                            <div class="box">
                                Whether it's front-end design to give your webfront a bang-up presentation,
                                developing and writing the business logic of your application in the middle tier,
                                or plotting out and constructing the database end of things, we've got you covered.
                            </div>
                        </div>
                        
                        <img src="Images/trioSphere.png" alt="very technical" />
                    </div>
                </div>
                <div class="item">
                    <div class="content">
                        <span class="head">Training & Support</span>
                        <div class="wrap">
                            <div class="box">
                                We're here to help you and fully support all of the
                                services we provide. We also offer general technical support
                                and software training, to help keep your business productive
                                and on the move!
                            </div>
                        </div>
                        <img src="Images/gearSphere.png" alt="wow" />
                    </div>
                </div>
            </div>
            <div id="BOTTOM">
                <br /><br /><br />
                <h1>Website Under Construction</h1><br />
                <h2>Please bear with us.</h2><br />
                <img src="Images/logo.png" />
            </div>
        </div>
        
    </div>
</asp:Content>

