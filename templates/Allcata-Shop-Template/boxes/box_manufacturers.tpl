
<div id="search_filters_brands" class="block">
    <h4 class="block_title hidden-md-down">{lang key="manufacturers" section="global"}</h4>
    <h4 class="block_title hidden-lg-up" data-target="#block_brands_toggle" data-toggle="collapse">{lang key="manufacturers" section="global"}
        <span class="float-xs-right">
		  <span class="navbar-toggler collapse-icons">
		  <i class="material-icons add">&#xE313;</i>
		  <i class="material-icons remove">&#xE316;</i>
		  </span>
		</span>
    </h4>

    <div class="block_content collapse" id="block_brands_toggle">
        <ul>
            {foreach name=hersteller from=$oBox->manufacturers item=hst}
                <li><a href="{$hst->cSeo}" title="{$hst->cName|escape:"html"}">{$hst->cName|escape:"html"}</a></li>
            {/foreach}

            <li>
                <a href="#" title="">
                    Flavia
                </a>
            </li>
            <li>
                <a href="#" title="">
                    Fornelli
                </a>
            </li>
            <li>
                <a href="#" title="">
                    Krona
                </a>
            </li>
            <li>
                <a href="#" title="randomised">
                    Vlano
                </a>
            </li>
            <li>
                <a href="#" title="renaissance">
                    Vents
                </a>
            </li>
        </ul>
    </div>
</div>