<#import "/templates/system/common/cstudio-support.ftl" as studio />
<#import "/templates/web/lib/macros.ftl" as macros />

<!doctype html>
<html class="no-js" lang="en">

<#include "/templates/web/components/head.ftl" />
<body>
	<#assign inverted = false>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
        <!--header-->
        <@renderComponent component = contentModel.mobileNavigation.item />
        <div class="off-canvas-content" data-off-canvas-content>
            <@renderComponent component = contentModel.header.item additionalModel = { 'currentPage' : model.storeUrl, 'backLink' : model.backLink } />
            <!--breadcrumbs-->
            <@macros.breadcrumb/>

            <!-- registration -->
            <section class="registration">
                <div class="row secBg">
                    <div class="large-12 columns">
                        <div class="login-register-content">
                            <div class="row collapse borderBottom">
                                <div class="medium-6 large-centered medium-centered">
                                    <div class="page-heading text-center">
                                        <h3>${contentModel.heroTitle}</h3>
                                        ${contentModel.heroText_html}
                                    </div>
                                </div>
                            </div>
                            <div class="row" data-equalizer data-equalize-on="medium" id="test-eq">
                                <div class="large-4 large-offset-4 medium-6 medium-offset-3 columns end">
                                    <div class="register-form">
                                        <h5 class="text-center">${contentModel.formTitle}</h5>
                                        <form method="post" data-abide novalidate action="${contentModel.formAction}">
                                            <div data-abide-error class="alert callout" style="display: none;">
                                                <p><i class="fa fa-exclamation-triangle"></i> There are some errors in your form.</p>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-label"><i class="fa fa-user"></i></span>
                                                <input class="input-group-field" type="text" placeholder="Enter your username" name="username" required>
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-label"><i class="fa fa-envelope"></i></span>
                                                <input class="input-group-field" type="email" placeholder="Enter your email" name="email" required>
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-label"><i class="fa fa-lock"></i></span>
                                                <input type="password" id="password" placeholder="Enter your password" name="password" required>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-label"><i class="fa fa-lock"></i></span>
                                                <input type="password" placeholder="Re-type your password" required pattern="alpha_numeric" data-equalto="password">
                                            </div>
                                            <span class="form-error">your email is invalid</span>
                                            <button class="button expanded" type="submit" name="submit">${contentModel.formLabel}</button>
                                            <p class="loginclick"> <a href="/login">Login here</a><a href="/login">Already have acount?</a></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- footer -->
            <@renderComponent component = contentModel.footer.item />
        </div><!--end off canvas content-->
    </div><!--end off canvas wrapper inner-->
</div><!--end off canvas wrapper-->
<!-- script files -->
<#include "/templates/web/components/scripts.ftl" />
<@studio.toolSupport />
</body>
</html>