{* template to display products in slider *}

<div class="thumbnail-container">
    <div class="image-block">
    <a class="thumbnail product-thumbnail" href="{$Artikel->cURL}">
        {if isset($Artikel->Bilder[0]->cAltAttribut)}
            {assign var="alt" value=$Artikel->Bilder[0]->cAltAttribut|strip_tags|truncate:60|escape:"html"}
        {else}
            {assign var="alt" value=$Artikel->cName}
        {/if}

        {*include file="snippets/image.tpl" src=$Artikel->Bilder[0]->cPfadKlein alt=$alt*}
        <img class="primary-image" src="{$Artikel->Bilder[0]->cPfadGross}" alt="{$alt}" data-full-size-image-url="{$Artikel->Bilder[0]->cPfadGross}" />
        {if isset($Artikel->oSuchspecialBild) && !isset($hideOverlays)}
            <img width=200 class="replace-2x img_hover img-responsive secondary-image" src="{$Artikel->oSuchspecialBild->cPfadKlein}"
                 data-full-size-image-url="{$Artikel->oSuchspecialBild->cPfadGross}" alt="{if isset($Artikel->oSuchspecialBild->cSuchspecial)}{$Artikel->oSuchspecialBild->cSuchspecial}{else}{$Artikel->cName}{/if}">
        {/if}
    </a>
    </div>

    <div class="highlighted-informations hidden-sm-down">
        <div class="variant-links">
            <a href="#" class="color" title="Orange" style="background-color: #F39C11"><span class="sr-only">Orange</span></a>
            <a href="" class="color" title="Blue" style="background-color: #5D9CEC"><span class="sr-only">Blue</span></a>
            <span class="js-count count"></span>
        </div>
    </div>
</div>
<div class="product-description">
        {if $Einstellungen.bewertung.bewertung_anzeigen === 'Y' && $Artikel->fDurchschnittsBewertung > 0}<small>
            {include file='productdetails/rating.tpl' stars=$Artikel->fDurchschnittsBewertung}</small>
        <div class="comments_note">
            <div class="star_content clearfix">
                <div class="star star_on"></div>
                <div class="star star_on"></div>
                <div class="star"></div>
                <div class="star"></div>
                <div class="star"></div>
            </div>
            <span>2 Review(s)&nbsp</span>
        </div>
        {/if}

        <span class="h3 product-title" itemprop="name"><a href="{$Artikel->cURL}" title="{$Artikel->cKurzbezeichnung}">{$Artikel->cKurzbezeichnung}</a></span>
        <div class="product-price-and-shipping">
            {if isset($Artikel->Preise->strPreisGrafik_Suche)}
                {include file="productdetails/price.tpl" Artikel=$Artikel price_image=$Artikel->Preise->strPreisGrafik_Suche tplscope=$tplscope}
            {else}
                {include file="productdetails/price.tpl" Artikel=$Artikel price_image=null tplscope=$tplscope}
            {/if}
        </div>
    <div class="product-actions">
        <form action="warenkorb.php" method="post"
              class="add-to-cart-or-refresh">
            {$jtl_token}
            <button id="submit{$Artikel->kArtikel}" class="btn btn-primary add-to-cart" data-button-action="add-to-cart" type="submit"
                    title="{lang key="addToCart" section="global"}">
                {lang key="addToCart" section="global"}
                <!--<span class="pst-product-cart pst-product-tooltip">Add to cart</span>-->
            </button>
        </form>
        <a href="{$Artikel->cURL}" class="quick-view" data-link-action="quickview" title="{$Artikel->cName}">
            {$Artikel->cName}
        </a>
    </div>


    </div>
{* /product-cell *}
