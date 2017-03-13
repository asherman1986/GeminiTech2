<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Our Services</title>
    <link rel="stylesheet" href="Styles/Services.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            onLoad();
            var $lastPage;
            function onLoad() {
               
                //okay what do I want to do here. I just want to hide the lists and their contents. Not what's in the lists themselves.
                //Gotta think of an elegant way to do this.
                $('#ServMain').children().each(function () {
                    var i = $(this).index();
                    if (i == 0) {
                        //it's the first list. So show the first li and hide all others. 
                        //JUST the list elements. 
                        $(this).children().each(function () {
                            if ($(this).index() != 0) {
                                $(this).hide();
                            }
                        });
                    }
                    else {
                        $(this).children().each(function () {
                            $(this).hide();
                        });
                    }
                });


                //hide every single ul element in #ServMain
                //$('#ServMain ul').hide();

                ////show the first ul element in #ServMain
                //$('#ServMain ul').first().show();

                ////for each child element in the first ul element in #ServMain...
                //$('#ServMain ul').first().children().each(function () {
                //    //if the index is not 0, hide this element. 
                //    if (!parseInt($(this).index()) == 0) {
                //        $(this).hide();
                //    } else { //otherwise...set the last page to this...this shouldn't be assigned here. 
                        
                //        //$('.details *').show();
                //    }
                //});
                ////this is a better place to assign $lastPage
                $lastPage = $('#ServMain .list0').find('.page0');
            }
            $('#Menu h3').click(function (e) {
                e.preventDefault();
                $("#Menu ul ul").slideUp();
                if (!$(this).next().is(":visible")) {
                    $(this).next().slideDown();
                }
                
            });

            $('#Menu ul ul li a').click(function (e) {
                var $currPage;
                e.preventDefault();
                
                var j = ($(this).parent().index()); //index of the li
                var i = $(this).parent().parent().parent().index(); //index of the ul
                $currPage = $('#ServMain .list' + i).find('.page' + j);
                if ($currPage == $lastPage) {
                    return; 
                }
                else {
                    $lastPage.fadeOut();
                    $('#ServMain > ul').not('.list' + i).fadeOut();
                    $('#ServMain .list' + i).show().find('.page' + j).children().fadeIn();
                    $currPage.fadeIn();
                    $lastPage = $currPage;
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <div id="Top">
        <div class="content">
            <div class="introduction">
                <br />
                <img src="Images/tech2.jpg" alt="Solutions Tailored to You" />
                <h1>Our Services</h1>
                <p>
                    Gemini offers a diverse collection of both technical and creative services that cover a broad
                    spectrum of business needs, whether you just need to jazz up a dated company logo, or launch
                    a full-fledged data-driven web application to serve your customers. Our flexibility and versatility
                    enables us to design a solution capable of scaling with your business's needs, without requiring
                    massive revisions, updates, and upkeep.  
                </p>
            </div>
            <div id="Services">
                <div id="Menu">
                    <ul>
                        <li class="active"> <%--index = 0--%>
                            <h3><a href="#Web">Web Development</a></h3>
                            <ul>
                                <li><a href="#">Starter Site</a></li>
                                <li><a href="#">Basic Custom</a></li>
                                <li><a href="#">Premium Custom</a></li>
                                <li><a href="#">Advanced Site</a></li>
                            </ul>

                        </li>
                        <li> <%--index = 1--%>
                            <h3><a href="#Graphics">Graphic Design</a></h3>
                            <ul>
                                <li><a href="#">Web Graphics</a></li>
                                <li><a href="#">Logos & Icons</a></li>
                                <li><a href="#">Print Media</a></li>
                                <li><a href="#">Advertising</a></li>
                            </ul>
                        </li>
                        <li>
                            <h3><a href="#AppDev">Application Development</a></h3> 
                            <ul>
                                <li><a href="#">Web Applications</a></li>
                                <li><a href="#">Desktop Applications</a></li>
                                <li><a href="#">Database Development</a></li>
                            </ul>   
                        </li>
                        <li>
                            <h3><a href="#Tech">Tech Support</a></h3>
                            <ul>
                                <li><a href="#">Remote Support</a></li>
                                <li><a href="#">Bug Fixes</a></li>
                                <li><a href="#">Software Training</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
                <div id="ServMain">
                    <ul class="list0"> <%-- index = 0 --%>
                        <li class="page0"><%--index 0--%>
                            <div class="page">
                                <%--Starter Site--%>
                                <h2>Starter Site</h2>
                                <p>
                                    So you're ready to get your business (or just yourself) onto the web, but you don't want a lot of hassle. 
                                    You've pretty much got all of the content you need to put on your new site, you've got a logo. All you 
                                    really need is someone to throw it all together for you in a simple fashion that isn't real fancy but 
                                    still looks nice and professional. The Starter Site package would be a great option for you! 
                                </p>
                                <div class="details">
                                    <h3>Features</h3>
                                    <ul>
                                        <li>Up to 5 Content Pages</li>
                                        <li>Your choice of template</li>
                                        <li>Up to 3 revisions</li>
                                        <li>Free Hosting for 1 year*</li>
                                    </ul>
                                    <div class="price">
                                        <span class="special">$300</span>
                                    </div>
                                    <span class="note">*Free hosting and/or support included when you register a new domain name or transfer your existing domain.</span>
                                </div>
                                
                            </div>
                            
                        </li>
                        <li class="page1">
                            <div class="page">
                            <%--Basic Custom--%>
                                <h2>Basic Custom Site</h2>
                                <p>
                                    When it comes to your site, you'd like something basic, but personalized a little more than an out-of-the-box
                                    template-based site. You're probably going to need a logo designed or re-designed, some content development, 
                                    and you feel like a few minor effects here and there would be nice. The Basic Custom package allowed you to 
                                    have a good-looking, basic, informative website created to suit you, while still staying on a budget. 
                                </p>
                                <div class="details">
                                    <h3>Features</h3>
                                    <ul>
                                        <li>Up to 10 Content Pages</li>
                                        <li>Custom designed basic layout</li>
                                        <li>Custom logo and icon design</li>
                                        <li>Minor content development</li>
                                        <li>CSS Effects</li>
                                        <li>Built-in Contact Form</li>
                                        <li>Up to 10 revisions</li>
                                        <li>Free hosting for 1 year*</li>
                                    </ul>
                                    <div class="price">
                                        <span class="special">$750</span>
                                    </div>
                                    <span class="note">*Free hosting and/or support included when you register a new domain name or transfer your existing domain.</span>
                                </div>
                            </div>
                        </li>
                        <li class="page2">
                            <div class="page">
                                <h2>Premium Custom</h2>
                                <p>
                                    For your site, you have a bit more of an elaborate vision in mind. We'll design custom graphics throughout
                                    the site, help you develop the content, and fine-tune an interactive navigation and layout. You may need 
                                    elements like a slideshow or a photogallery. This option includes the heavy use of jQuery and CSS to bring you 
                                    a totally customized, dynamic web experience. 
                                </p>
                                <div class="details">
                                    <h3>Features</h3>
                                    <ul>
                                        <li>up to 15 content pages</li>
                                        <li>Fully customized layout</li>
                                        <li>Custom logo, icon, and graphics design</li>
                                        <li>CSS Effects</li>
                                        <li>Customized jQuery/JavaScript Elements</li>
                                        <li>Built-in Contact form</li>
                                        <li>Up to 20 revisions</li>
                                        <li>Free Hosting for 1 year*</li>
                                    </ul>
                                    <div class="price">
                                        <span class="special">$1500</span>
                                    </div>
                                    <span class="note">*Free hosting and/or support included when you register a new domain name or transfer your existing domain.</span>
                                </div>
                            </div>
                        </li>
                        <li class="page3">
                            <div class="page">
                                <h2>Advanced Web</h2>
                                <p>
                                    Your project is going to require more than fancy front-end bells and whistles to make its mark. While this package includes
                                    all of the niceties of the Premium Custom package, it also extends to interactivity with the back end. For example, you need
                                    your users to log in, you need data retrieved from a database dynamically; you want a seamless AJAX web application to deliver 
                                    convenience and accessibility to your clients. This is the package you're looking for. 
                                </p>
                                <div class="details">
                                    <h3>Features</h3>
                                    <ul>
                                        <li>Unlimited Content Pages</li>
                                        <li>Fully Customized layout and graphic design</li>
                                        <li>CSS, jQuery/JavaScript, AJAX development</li>
                                        <li>Database Interactivity & development</li>
                                        <li>Up to 50 revisions</li>
                                        <li>Free Hosting for 1 year*</li>
                                        <li>Free Updates, Maintenance and Tech support for 1 year*</li>
                                    </ul>
                                    <div class="price">
                                        <span class="special">$2500**</span>
                                    </div>
                                    <span class="note">
                                        *Free hosting and/or support included when you register a new domain name or transfer your existing domain.<br />
                                        **Price depends on scope and duration of project; a consultation is required to produce an accurate quote.
                                    </span>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul class="list1"><%-- index 1 --%>
                        <li class="page0">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page1">
                            <div class="page">
                               <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page2">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page3">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                    </ul>
                    <ul class="list2">
                        <li class="page0">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page1">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page2">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                    </ul>
                    <ul class="list3">
                        <li class="page0">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page1">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                        <li class="page2">
                            <div class="page">
                                <span class="special">Content coming soon!</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

