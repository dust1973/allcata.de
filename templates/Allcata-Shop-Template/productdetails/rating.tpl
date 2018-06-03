{if $stars > 0}
    {assign var=filename1 value='rate'}
    {assign var=filename3 value='.png'}
    {if isset($total) && $total > 1}
        {lang key='averageProductRating' section='product rating' assign='ratingLabelText'}
    {else}
        {lang key='productRating' section='product rating' assign='ratingLabelText'}
    {/if}
    {block name="productdetails-rating"}
    <div class="comments_note" title="{$ratingLabelText}: {$stars}/5">
        <div class="star_content clearfix">
    {strip}
        {if $stars >= 5}
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star star_on"></div>
        {elseif $stars >= 4}
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star "></div>
        {elseif $stars >= 3}
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star "></div>
            <div class="star "></div>
        {elseif $stars >= 2}
            <div class="star star_on"></div>
            <div class="star star_on"></div>
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
        {elseif $stars >= 1}
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
        {elseif $stars > 0}
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
            <div class="star "></div>
        {/if}
    {/strip}
        </div>
    </div>
    {/block}
{/if}