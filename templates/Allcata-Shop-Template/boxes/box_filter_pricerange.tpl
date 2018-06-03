{if $bBoxenFilterNach && $BoxenEinstellungen.navigationsfilter.preisspannenfilter_benutzen === 'box'}
    {if $Suchergebnisse->Preisspanne|@count > 0}
<div id="search_filters_price" class="block">

    <h4 class="block_title hidden-md-down">{lang key="rangeOfPrices" section="global"}</h4>
            <div class="block_content">
                <div id="_desktop_search_filters_clear_all" class="hidden-md-down clear-all-wrapper">
                    <a href="navi.php?k={$AktuelleKategorie->kKategorie}">
                        <i class="material-icons">&#xE14C;</i>
                        Filter entfernen
                    </a>
                </div>
                {include file='snippets/filter/pricerange.tpl'}
            </div>

</div>
    {/if}
{/if}
