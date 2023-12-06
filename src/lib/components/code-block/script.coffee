import "svelte-highlight/styles/stackoverflow-dark.css"
import coffeescript from "svelte-highlight/languages/coffeescript"
import Fa from 'svelte-fa/src/fa.svelte'
import Highlight from "svelte-highlight"
import javascript from "svelte-highlight/languages/javascript"
import shell from "svelte-highlight/languages/shell"
import toast from 'svelte-french-toast'
import { copy } from 'svelte-copy'
import { faCopy } from '@fortawesome/free-solid-svg-icons'
import { faFolder } from '@fortawesome/free-solid-svg-icons'
import { faTerminal } from '@fortawesome/free-solid-svg-icons'
import { Toaster } from 'svelte-french-toast'

`export let code_copy`
`export let code_text`
`export let file_path`

copyToast = ->
  (toast 'Copied', {
    duration: 1200
    position: 'bottom-center'
    style: 'background: #333; color: #fff; padding: 2px 4px; border-radius: 8px;'
  })

