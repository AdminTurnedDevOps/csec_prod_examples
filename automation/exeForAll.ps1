function exeForAll {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact='medium')]
    param(
        [parameter(Position = 0, HelpMessage="Path to where Kubernetes-Goat/Scenarios exists")]
        [string]$directory = "/Users/michael/gitrepos/csec_prod_examples/kubernetes/kubegoat/kubernetes-goat/scenarios",

        [parameter(Position = 1, HelpMessage="Path to where the Kubesec binary exists")]
        [string]$kubesec = "/Users/michael/gitrepos/csec_prod_examples/kubernetes/kubegoat/kubernetes-goat/kubesec1"

    )
        $env:Path=$kubesec

        Set-Location -Path $directory/"batch-check/"
        $child = Get-ChildItem
        for ($i -in $child) {
            kubesec scan $i*
            Set-Location ..
            break
        }

        Set-Location -Path "health-check/"
        $child = Get-ChildItem
        for ($i -in $child) {
            kubesec scan $i*
            Set-Location ..
            break 
        }
}

exeForAll