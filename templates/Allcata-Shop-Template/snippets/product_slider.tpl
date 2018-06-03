{strip}
{if $productlist|@count > 0}

    {if !isset($tplscope)}
        {assign var='tplscope' value='slider'}
    {/if}
    <section class="{$class}">
        <div class="products container">
            {if $title|strlen > 0}
            <h2 class="h1 products-section-title text-uppercase">
                    {$title}
            </h2>
            {/if}
         <div class="homeproducts-row">
             <div class="product-carousel">
                 <ul id="pstbestseller-carousel" class="pstbestseller-carousel pst-carousel product_list">
             {foreach name="sliderproducts" from=$productlist item='product'}
                     <li class="item">
                         <div class="product-miniature js-product-miniature" data-id-product="1" data-id-product-attribute="1" itemscope itemtype="http://schema.org/Product">
                                {include file='productlist/item_slider.tpl' Artikel=$product tplscope=$tplscope class=''}
                         </div>
                     </li>
                {/foreach}
                 </ul>
             </div>
         </div>
        </div>
    </section>{* /panel *}
{/if}
{/strip}