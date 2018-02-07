<#import "/templates/web/lib/macros.ftl" as macros />

<#assign favoriteVideos = (profile.attributes.favoriteVideos)![] />

<!doctype html>
<html class="no-js" lang="en">

<#include "/templates/web/components/head.ftl" />
<body>
	<#assign inverted = false>
	<#include "/templates/web/components/persistent-nav.ftl">
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
        <!--header-->
        <@renderComponent component = contentModel.mobileNavigation.item />
        <div class="off-canvas-content" data-off-canvas-content>
            <@renderComponent component = contentModel.header.item additionalModel = { 'currentPage' : model.storeUrl, 'backLink' : model.backLink } />
            <!--breadcrumbs-->
            <@macros.breadcrumb/>
            <!-- profile top section -->
            <section class="topProfile">
                <div class="profile-stats">
                    <div class="row secBg">
                        <div class="large-12 columns">
                            <div class="profile-author-img">
                                <img src="/api/1/profile/avatar" alt="profile author img">
                            </div>
                            <div class="clearfix">
                                <div class="profile-author-name float-left">
                                    <h4>${(profile.attributes.displayName)!profile.username}</h4>
                                    <p>Join Date : <span>${profile.createdOn?datetime?string("dd MMMM yyyy")}</span></p>
                                </div>
                                <div class="profile-author-stats float-right">
                                    <ul class="menu">
                                        <li>
                                            <div class="icon float-left">
                                                <i class="fa fa-heart"></i>
                                            </div>
                                            <div class="li-text float-left">
                                                <p class="number-text">${favoriteVideos?size}</p>
                                                <span>favorites</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End profile top section -->
            <div class="row">
                <!-- left sidebar -->
                <div class="large-4 columns">
                    <aside class="secBg sidebar">
                        <div class="row">
                            <!-- profile overview -->
                            <div class="large-12 columns">
                                <div class="widgetBox">
                                    <div class="widgetTitle">
                                        <h5>Profile Overview</h5>
                                    </div>
                                    <div class="widgetContent">
                                        <ul class="profile-overview">
                                            <li data-tab-profile="description" class="clearfix"><a class="active" href="#"><i class="fa fa-user"></i>about me</a></li>
                                            <li data-tab-profile="favorites" class="clearfix"><a href="#"><i class="fa fa-heart"></i>Favorite Videos<span class="float-right">${favoriteVideos?size}</span></a></li>
                                            <li data-tab-profile="settings" class="clearfix"><a href="#"><i class="fa fa-gears"></i>Profile Settings</a></li>
                                            <li class="clearfix"><a href="/crafter-security-logout"><i class="fa fa-sign-out"></i>Logout</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div><!-- End profile overview -->
                        </div>
                    </aside>
                </div><!-- end sidebar -->
                <!-- right side content area -->
                <div class="large-8 columns profile-inner">
                    <!-- single post description -->
                    <section data-content="description" class="singlePostDescription">
                        <div class="row secBg">
                            <div class="large-12 columns">
                                <div class="heading">
                                    <i class="fa fa-user"></i>
                                    <h4>Description</h4>
                                </div>
                                <div class="description">
                                    <p>${(profile.attributes.bio)!""}</p>
                                    <div class="email profile-margin">
                                        <button><i class="fa fa-envelope"></i>Email</button>
                                        <span class="inner-btn">${profile.email}</span>
                                    </div>
                                    <#if (profile.attributes.phone)?has_content>
                                    <div class="phone profile-margin">
                                        <button><i class="fa fa-phone"></i>Phone</button>
                                        <span class="inner-btn">${(profile.attributes.phone)!""}</span>
                                    </div>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </section><!-- End single post description -->
                    <section data-content="favorites" class="profile-videos hide">
                        <div class="row secBg">
                            <div class="large-12 columns">
                                <div class="heading">
                                    <i class="fa fa-video-camera"></i>
                                    <h4>My Videos</h4>
                                </div>
                                <div id="fav-list"></div>
                                <div class="show-more-inner text-center">
                                    <a href="#" class="show-more-btn">show more</a>
                                </div>
                            </div>
                        </div>
                    </section><!-- End single post description -->
                    <!-- profile settings -->
                    <section data-content="settings" class="profile-settings hide">
                        <div class="row secBg">
                            <div class="large-12 columns">
                                <div class="heading">
                                    <i class="fa fa-gears"></i>
                                    <h4>Profile Settings</h4>
                                </div>
                                <div class="row">
                                    <div class="large-12 columns">
                                        <div class="setting-form">
                                            <form action="/api/1/profile/avatar.json" method="post" enctype="multipart/form-data">
                                                <div class="setting-form-inner">
                                                    <div class="row">
                                                        <div class="large-12 columns">
                                                            <h6 class="borderBottom">Avatar:</h6>
                                                        </div>
                                                        <div class="large-12 columns">
                                                            <input type="file" name="file"/>
                                                            <button class="button expanded" type="submit">Upload</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <form action="/api/1/profile/update.json" method="post">
                                                <div class="setting-form-inner">
                                                    <div class="row">
                                                        <div class="large-12 columns">
                                                            <h6 class="borderBottom">Username Setting:</h6>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>First Name:
                                                                <input type="text" name="firstName" value="${(profile.attributes.firstName)!""}" placeholder="enter your first name..">
                                                            </label>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>Last Name:
                                                                <input type="text" name="lastName" value="${(profile.attributes.lastName)!""}" placeholder="enter your last name..">
                                                            </label>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>Nick Name:
                                                                <input type="text" readonly value="${(profile.username)!""}" placeholder="enter your nick name..">
                                                            </label>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>Display Name:
                                                                <input type="text" name="displayName" value="${(profile.attributes.displayName)!""}" placeholder="select your display name">
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="setting-form-inner">
                                                    <div class="row">
                                                        <div class="large-12 columns">
                                                            <h6 class="borderBottom">Update Password:</h6>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>New Password:
                                                                <input type="password" name="password" placeholder="enter your new password..">
                                                            </label>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>Retype Password:
                                                                <input type="password" placeholder="enter your new password..">
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="setting-form-inner">
                                                    <div class="row">
                                                        <div class="large-12 columns">
                                                            <h6 class="borderBottom">About Me:</h6>
                                                        </div>
                                                        <div class="medium-6 columns">
                                                            <label>Email ID:
                                                                <input type="email" value="${profile.email}" readonly placeholder="enter your email address..">
                                                            </label>
                                                        </div>
                                                        <div class="medium-6 columns end">
                                                            <label>Phone No:
                                                                <input type="tel" name="phone" value="${(profile.attributes.phone)!""}" placeholder="enter your website url..">
                                                            </label>
                                                        </div>
                                                        <div class="medium-12 columns">
                                                            <label>Bio Description:
                                                                <textarea name="bio">${(profile.attributes.bio)!""}</textarea>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="setting-form-inner">
                                                    <button class="button expanded" type="submit" name="setting">update now</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section><!-- End profile settings -->
                </div><!-- end left side content area -->
            </div>

            <!-- footer -->
            <@renderComponent component = contentModel.footer.item />
        </div><!--end off canvas content-->
    </div><!--end off canvas wrapper inner-->
</div><!--end off canvas wrapper-->
<!-- script files -->
<#include "/templates/web/components/scripts.ftl" />
<script src="/static-assets/js/jsrender.js"></script>
<script id="favoritesTemplate" type="text/x-jsrender">
{{for items}}
<div class="profile-video">
    <div class="media-object stack-for-small">
        <div class="media-object-section media-img-content">
            <div class="video-img">
                <img src="{{:thumbnail}}" alt="{{:title_s}}">
            </div>
        </div>
        <div class="media-object-section media-video-content">
            <div class="video-content">
                <h5><a href="{{:~videoUrl(id)}}">{{:title_s}}</a></h5>
                <p>{{:summary_s}}</p>
            </div>
            <div class="video-detail clearfix">
                <div class="video-stats">
                    <span><i class="fa fa-clock-o"></i>{{:date_dt}}</span>
                    <span><i class="fa fa-eye"></i>{{:viewCount}}</span>
                </div>
                <div class="video-btns">
                    <a class="button unfav-button" data-videoId="{{:id}}"><i class="fa fa-heart-o"></i>Unfavorite</a>
                </div>
            </div>
        </div>
    </div>
</div>
{{/for}}
</script>
<script>
    function loadResults(params) {
        jQuery.get('/api/1/profile/favorites.json', params, function(res){
            if(res.items) {
                jQuery('#fav-list').html(jQuery.templates('#favoritesTemplate').render(res));
            }
        });
    }

	jQuery.views.helpers({
		videoUrl: function(id) {
			return '${contentModel.videoLandingURL}?id=' + id;
		}
	});

    jQuery(document).ready(function(){
        loadResults({});
        jQuery("body").on("click", ".unfav-button", function(evt){
            var videoId = jQuery(evt.target).attr("data-videoId");
            jQuery.get("/api/1/profile/toggle/favorite.json", { id:videoId }, function(){
                loadResults();
            });
        });
        
        jQuery('[data-tab-profile]').on('click', function (e) {
            jQuery(this).children().addClass('active');
            jQuery(this).siblings('[data-tab-profile]').children().removeClass('active');
            jQuery('[data-content=' + jQuery(this).data('tab-profile') + ']').removeClass('hide').siblings('[data-content]').addClass('hide');
            e.preventDefault();
        });
    });
</script>
</body>
</html>