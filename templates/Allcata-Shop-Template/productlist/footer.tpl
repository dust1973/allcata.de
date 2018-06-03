{if $Suchergebnisse->Artikel->elemente|@count > 0}
    {if $Einstellungen.navigationsfilter.allgemein_tagfilter_benutzen === 'Y'}
        {if $Suchergebnisse->Tags|@count > 0 && $Suchergebnisse->TagsJSON}
            <hr>
            <div class="panel panel-default tags">
                <div class="panel-heading">{lang key="productsTaggedAs" section="productOverview"}</div>
                <div class="panel-body">
                    {foreach name=tagfilter from=$Suchergebnisse->Tags item=oTag}
                        <a href="{$oTag->cURL}" class="label label-primary tag{$oTag->Klasse}">{$oTag->cName}</a>
                    {/foreach}
                </div>
            </div>
        {/if}
    {/if}

    {if $Einstellungen.navigationsfilter.suchtrefferfilter_nutzen === 'Y'}
        {if $Suchergebnisse->SuchFilter|@count > 0 && $Suchergebnisse->SuchFilterJSON}
            {if empty($NaviFilter->SuchFilter->kSuchanfrage)}
                <hr>
                <div class="panel panel-default tags">
                    <div class="panel-heading">{lang key="productsSearchTerm" section="productOverview"}</div>
                    <div class="panel-body">
                        {foreach name=suchfilter from=$Suchergebnisse->SuchFilter item=oSuchFilter}
                            <a href="{$oSuchFilter->cURL}" class="label label-primary tag{$oSuchFilter->Klasse}">{$oSuchFilter->cSuche}</a>
                        {/foreach}
                    </div>
                </div>
            {/if}
        {/if}
    {/if}
{/if}

{if $Suchergebnisse->Seitenzahlen->maxSeite > 1 && !empty($oNaviSeite_arr) && $oNaviSeite_arr|@count > 0}

    <nav class="pagination row">
        {if $Suchergebnisse->GesamtanzahlArtikel > 0}
            <div class="col-md-4">
                {lang key="products" section="global"} {$Suchergebnisse->ArtikelVon} - {$Suchergebnisse->ArtikelBis} {lang key="of" section="productOverview"} {$Suchergebnisse->GesamtanzahlArtikel}
            </div>
        {/if}
        <div class="col-md-8">
            <ul class="page-list clearfix text-xs-center">
                {if $Suchergebnisse->Seitenzahlen->AktuelleSeite > 1}
                    <li class="prev">
                        <a class="previous disabled js-search-link" rel="prev" href="{$oNaviSeite_arr.zurueck->cURL}"><i class="material-icons">&#xE314;</i> {lang key="previous" section="productOverview"}</a>
                    </li>
                {/if}

                {foreach name=seite from=$oNaviSeite_arr item=oNaviSeite}
                    {if !isset($oNaviSeite->nBTN)}
                        <li class=" {if !isset($oNaviSeite->cURL) || $oNaviSeite->cURL|strlen === 0}current{/if}">
                            {if !empty($oNaviSeite->cURL)}
                                <a  rel="nofollow" class="disabled js-search-link" href="{$oNaviSeite->cURL}">{$oNaviSeite->nSeite}</a>
                            {else}
                                <a  rel="nofollow" href="#" class="disabled js-search-link" onclick="return false;">{$oNaviSeite->nSeite}</a>
                            {/if}
                        </li>
                    {/if}
                {/foreach}

                {if $Suchergebnisse->Seitenzahlen->AktuelleSeite < $Suchergebnisse->Seitenzahlen->maxSeite}
                    {*
                    <li>
                        .. {lang key="of" section="productOverview"} {$Suchergebnisse->Seitenzahlen->MaxSeiten}
                    </li>
                    *}
                    <li>
                        <a rel="next" class="next js-search-link" href="{$oNaviSeite_arr.vor->cURL}">{lang key="next" section="productOverview"} <i class="material-icons">&#xE315;</i></a>
                    </li>
                {/if}
            </ul>
        </div>
    </nav>
{/if}
