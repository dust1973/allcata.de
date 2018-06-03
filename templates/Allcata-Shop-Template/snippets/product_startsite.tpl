{foreach name="sliderproducts" from=$productlist item='product'}
    {if $class == 'top_angebot'}
        {assign var="alt" value=$product->Bilder[0]->cAltAttribut|strip_tags|truncate:60|escape:"html"}
    {else}
        <li class="pst-cmsblock-item col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
            <div class="pst-wrapper-cms-block">
                {if isset($product->Bilder[0]->cAltAttribut)}
                    {assign var="alt" value=$product->Bilder[0]->cAltAttribut|strip_tags|truncate:60|escape:"html"}
                {else}
                    {assign var="alt" value=$product->cName}
                {/if}
            {if $category->cBildURL !== 'gfx/keinBild.gif'}
                <a href="{$product->cURL}" class="pst-cms-img"><img src="{$category->cBildURLFull}" alt="{$alt}"/></a>

                {else}
                <a href="{$product->cURL}" class="pst-cms-img"><img src="./templates/Allcata-Shop-Template/themes/mytheme/slider/cat_1.jpg" alt="{$alt}"/></a>
            {/if}
                <div class="pst-cmsblock-details">
                    <span class="offer-text">{$boxname}</span>
                    <span class="name">{$product->cName}</span>
                    <a href="{$product->cURL}" class="cmsblock-btn">Jetzt kaufen</a>
                </div>
            </div>
        </li>
    {/if}

{/foreach}

