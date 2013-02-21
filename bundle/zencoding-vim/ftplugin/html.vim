
function! s:install_plugin()
  for item in [
  \ {'mode': 'i', 'var': 'user_zen_expandabbr_key', 'key': ',', 'plug': 'ZenCodingExpandAbbr', 'func': '<c-g>u<esc>:call zencoding#expandAbbr(0,"")<cr>a'},
  \ {'mode': 'v', 'var': 'user_zen_expandabbr_key', 'key': ',', 'plug': 'ZenCodingExpandVisual', 'func': ':call zencoding#expandAbbr(2,"")<cr>'},
  \ {'mode': 'n', 'var': 'user_zen_expandabbr_key', 'key': ',', 'plug': 'ZenCodingExpandNormal', 'func': ':call zencoding#expandAbbr(3,"")<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_expandword_key', 'key': ';', 'plug': 'ZenCodingExpandWord', 'func': '<c-g>u<esc>:call zencoding#expandAbbr(1,"")<cr>a'},
  \ {'mode': 'n', 'var': 'user_zen_expandword_key', 'key': ',', 'plug': 'ZenCodingExpandWord', 'func': ':call zencoding#expandAbbr(1,"")<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_balancetaginward_key', 'key': 'd', 'plug': 'ZenCodingBalanceTagInwardInsert', 'func': '<esc>:call zencoding#balanceTag(1)<cr>'},
  \ {'mode': 'n', 'var': 'user_zen_balancetaginward_key', 'key': 'd', 'plug': 'ZenCodingBalanceTagInwardNormal', 'func': ':call zencoding#balanceTag(1)<cr>'},
  \ {'mode': 'v', 'var': 'user_zen_balancetaginward_key', 'key': 'd', 'plug': 'ZenCodingBalanceTagInwardVisual', 'func': ':call zencoding#balanceTag(2)<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_balancetagoutward_key', 'key': 'D', 'plug': 'ZenCodingBalanceTagOutwardInsert', 'func': '<esc>:call zencoding#balanceTag(-1)<cr>'},
  \ {'mode': 'n', 'var': 'user_zen_balancetagoutward_key', 'key': 'D', 'plug': 'ZenCodingBalanceTagOutwardNormal', 'func': ':call zencoding#balanceTag(-1)<cr>'},
  \ {'mode': 'v', 'var': 'user_zen_balancetagoutward_key', 'key': 'D', 'plug': 'ZenCodingBalanceTagOutwardVisual', 'func': ':call zencoding#balanceTag(-2)<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_next_key', 'key': 'n', 'plug': 'ZenCodingNext', 'func': '<esc>:call zencoding#moveNextPrev(0)<cr>'},
  \ {'mode': 'n', 'var': 'user_zen_next_key', 'key': 'n', 'plug': 'ZenCodingNext', 'func': ':call zencoding#moveNextPrev(0)<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_prev_key', 'key': 'N', 'plug': 'ZenCodingPrev', 'func': '<esc>:call zencoding#moveNextPrev(1)<cr>'},
  \ {'mode': 'n', 'var': 'user_zen_prev_key', 'key': 'N', 'plug': 'ZenCodingPrev', 'func': ':call zencoding#moveNextPrev(1)<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_imagesize_key', 'key': 'i', 'plug': 'ZenCodingImageSize', 'func': '<esc>:call zencoding#imageSize()<cr>a'},
  \ {'mode': 'n', 'var': 'user_zen_imagesize_key', 'key': 'i', 'plug': 'ZenCodingImageSize', 'func': ':call zencoding#imageSize()<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_togglecomment_key', 'key': '/', 'plug': 'ZenCodingToggleComment', 'func': '<esc>:call zencoding#toggleComment()<cr>a'},
  \ {'mode': 'n', 'var': 'user_zen_togglecomment_key', 'key': '/', 'plug': 'ZenCodingToggleComment', 'func': ':call zencoding#toggleComment()<cr>'},
  \ {'mode': 'v', 'var': 'user_zen_mergelines_key', 'key': 'm', 'plug': 'ZenCodingMergeLines', 'func': ':call zencoding#mergeLines()<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_splitjointag_key', 'key': 'j', 'plug': 'ZenCodingSplitJoinTagInsert', 'func': '<esc>:call zencoding#splitJoinTag()<cr>'},
  \ {'mode': 'n', 'var': 'user_zen_splitjointag_key', 'key': 'j', 'plug': 'ZenCodingSplitJoinTagNormal', 'func': ':call zencoding#splitJoinTag()<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_removetag_key', 'key': 'k', 'plug': 'ZenCodingRemoveTag', 'func': '<esc>:call zencoding#removeTag()<cr>a'},
  \ {'mode': 'n', 'var': 'user_zen_removetag_key', 'key': 'k', 'plug': 'ZenCodingRemoveTag', 'func': ':call zencoding#removeTag()<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_anchorizeurl_key', 'key': 'a', 'plug': 'ZenCodingAnchorizeURL', 'func': '<esc>:call zencoding#anchorizeURL(0)<cr>a'},
  \ {'mode': 'n', 'var': 'user_zen_anchorizeurl_key', 'key': 'a', 'plug': 'ZenCodingAnchorizeURL', 'func': ':call zencoding#anchorizeURL(0)<cr>'},
  \ {'mode': 'i', 'var': 'user_zen_anchorizesummary_key', 'key': 'A', 'plug': 'ZenCodingAnchorizeSummary', 'func': '<esc>:call zencoding#anchorizeURL(1)<cr>a'},
  \ {'mode': 'n', 'var': 'user_zen_anchorizesummary_key', 'key': 'A', 'plug': 'ZenCodingAnchorizeSummary', 'func': ':call zencoding#anchorizeURL(1)<cr>'},
  \ {'mode': 'v', 'var': 'user_zen_codepretty_key', 'key': 'c', 'plug': 'ZenCodingCodePretty', 'func': ':call zencoding#codePretty()<cr>'},
  \]

    if !hasmapto('<plug>'.item.plug, item.mode)
      exe item.mode . 'noremap <buffer> <plug>' . item.plug . ' ' . item.func
    endif
    if !exists('g:' . item.var)
    endif
    if exists('g:' . item.var)
      let key = eval('g:' . item.var)
    else
      let key = g:user_zen_leader_key . item.key
    endif
    if len(maparg(key, item.mode)) == 0
      exe item.mode . 'map <buffer> <unique> ' . key . ' <plug>' . item.plug
    endif
  endfor
endfunction

call s:install_plugin()
delfunction s:install_plugin

