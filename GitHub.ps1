using namespace "System.Collections.Generic"
<# 
    Usage: 
        .\GitHub.ps1 
            -Login '<GitHub login>'
            -Token '<GitHub token>'
            -Owner '<owner>'
            -Repo '<repository>'
            -Author '<commit author>'
            -Date '<date from>'
    
    Example:
        .\GitHub.ps1 
            -Login 'test'
            -Token '***'
            -Owner 'Microsoft'
            -Repo 'CodeCamp'
            -Author 'john.smith@gmail.com'
            -Date ([DateTime]::Now.AddDays(-1))
#>
param(
    [string]$Login, [string]$Token, 
    [string]$Owner, [string]$Repo, 
    [string]$Author="pavelski01@gmail.com", [DateTime]$Date=[DateTime]::Now
)
$url = "https://api.github.com/repos/$($Owner)/$($Repo)/branches"
$since = Get-Date -Date $Date -Format "yyyy-MM-ddT00:00:00zzz"
$branchesJson = &".\WebClient.ps1" -Url $url -User $Login -Token $Token
$dict = [dictionary[string, list[string]]]::new()
$branchesJson.ForEach({
    $commit = $_.commit
    $sha = $commit.sha
    $url = "https://api.github.com/repos/$($Owner)/$($Repo)/commits?sha=$($sha)&author=$($Author)&since=$($since)"
    $commitsJson = &".\WebClient.ps1" -Url $url -User $Login -Token $Token
    if ($commitsJson -ne $null) {
        $key = $_.name
        $dict.Add($key, [list[string]]::new())
        $commitsJson.ForEach({
            $dict[$key].Add($_.commit.message)            
        })
    }
})
$dict.GetEnumerator() | ForEach-Object { 
    Write-Host "$($_.Key) - $($_.Value | Join-String -Separator '; ')" 
}