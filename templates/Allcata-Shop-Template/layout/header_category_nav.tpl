{strip}
    {block name="category-nav-megamenu"}
        {get_category_array categoryId=0 assign='categories'}
        {if !empty($categories)}
            {if !isset($activeId)}
                {if isset($NaviFilter->Kategorie) && intval($NaviFilter->Kategorie->kKategorie) > 0}
                    {$activeId = $NaviFilter->Kategorie->kKategorie}
                {elseif $nSeitenTyp == 1 && isset($Artikel)}
                    {assign var='activeId' value=$Artikel->gibKategorie()}
                {elseif $nSeitenTyp == 1 && isset($smarty.session.LetzteKategorie)}
                    {$activeId = $smarty.session.LetzteKategorie}
                {else}
                    {$activeId = 0}
                {/if}
            {/if}
            {if !isset($activeParents) && ($nSeitenTyp == 1 || $nSeitenTyp == 2)}
                {get_category_parents categoryId=$activeId assign='activeParents'}
            {/if}
            <ul class="top-menu" id="top-menu" data-depth="0">
        {foreach name='categories' from=$categories item='category'}
            {assign var='isDropdown' value=false}
            {if isset($category->bUnterKategorien) && $category->bUnterKategorien}
                {assign var='isDropdown' value=true}
                <li id="category-{$category->kKategorie}" class="{if $isDropdown}category{/if}{if $category->kKategorie == $activeId || (isset($activeParents[0]) && $activeParents[0]->kKategorie == $category->kKategorie)} active{/if}">
                    <a href="{$category->cURL}"{if $isDropdown} class="dropdown-item" data-depth="0" data-close-others="true"{/if}>

                            <span class="float-xs-right hidden-lg-up">
                            <span data-target="#top_sub_menu_20019" data-toggle="collapse" class="navbar-toggler collapse-icons">
                            <i class="material-icons add">&#xE145;</i>
                  	        <i class="material-icons remove">&#xE15B;</i>
                            </span>
                            </span>

                        {$category->cKurzbezeichnung}
                    </a>
                    {if $category->bUnterKategorien}
                        {if !empty($category->Unterkategorien)}
                            {assign var=sub_categories value=$category->Unterkategorien}
                        {else}
                            {get_category_array categoryId=$category->kKategorie assign='sub_categories'}
                        {/if}
                        <div  class="popover sub-menu js-sub-menu collapse" id="top_sub_menu_20019">
                        <ul class="top-menu"  data-depth="1">
                        {foreach name='sub_categories' from=$sub_categories item='sub'}

                                        <li class="category" id="category-{$sub->kKategorie}">
                                            <a class="dropdown-item dropdown-submenu" href="{$sub->cURL}" data-depth="1">
                                                <span class="float-xs-right hidden-lg-up">
                                                    <span data-target="#top_sub_menu_97573" data-toggle="collapse" class="navbar-toggler collapse-icons">
                                                        <i class="material-icons add">&#xE145;</i>
                                                        <i class="material-icons remove">&#xE15B;</i>
                                                    </span>
                                                </span>
                                {$sub->cKurzbezeichnung}
                                            </a>
                                        </li>

                        {/foreach}
                        </ul>


                        </div>
                    {/if}
                    {/if}
                </li>

        {/foreach}
            </ul>
        {/if}
        <div class="clearfix"></div>
    {/block}
{/strip}