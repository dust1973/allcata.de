{strip}
{has_boxes position='left' assign='hasLeftBox'}
{if !empty($Brotnavi) && !$bExclusive && !$bAjaxRequest && $nSeitenTyp != 18 && $nSeitenTyp != 11 && $nSeitenTyp != 38}
    <nav class="breadcrumb hidden-sm-down">

                <ol itemscope itemtype="http://schema.org/BreadcrumbList">
                    {foreach name=navi from=$Brotnavi item=oItem}
                        {if $smarty.foreach.navi.first}
                            {block name="breadcrumb-first-item"}
                                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                    <a itemprop="item" href="{$oItem->urlFull}" title="{$oItem->name|escape:'html'}">
                                        <span itemprop="name">{$oItem->name|escape:'html'}</span>
                                    </a>
                                    <meta itemprop="url" content="{$oItem->urlFull}" />
                                    <meta itemprop="position" content="{$smarty.foreach.navi.iteration}" />
                                </li>
                            {/block}
                        {elseif $smarty.foreach.navi.last}
                            {block name="breadcrumb-last-item"}
                                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                    <span itemprop="name">
                                        {if $oItem->name !== null}
                                            {if $oItem->hasChild === true}
                                                <a href="{$oItem->urlFull}" title="{$oItem->name|escape:'html'}">{$oItem->name}</a>
                                            {else}
                                                {$oItem->name}
                                            {/if}
                                        {elseif isset($Suchergebnisse->SuchausdruckWrite)}
                                            {$Suchergebnisse->SuchausdruckWrite}
                                        {/if}
                                    </span>
                                    <meta itemprop="position" content="{$smarty.foreach.navi.iteration}" />
                                </li>
                            {/block}
                        {else}
                            {block name="breadcrumb-item"}
                                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                    <a itemprop="item" href="{$oItem->urlFull}" title="{$oItem->name|escape:'html'}">
                                        <span itemprop="name">{$oItem->name}</span>
                                    </a>
                                    <meta itemprop="url" content="{$oItem->urlFull}" />
                                    <meta itemprop="position" content="{$smarty.foreach.navi.iteration}" />
                                </li>
                            {/block}
                        {/if}
                    {/foreach}
                </ol>
    </nav>
{/if}
{/strip}