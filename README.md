# GitHubScriptsSolution

### Usage: 
&emsp;.\GitHub.ps1 \
&emsp;&emsp;&emsp;-Login '\<GitHub login>' \
&emsp;&emsp;&emsp;-Token '\<GitHub token>' \
&emsp;&emsp;&emsp;-Owner '\<owner>' \
&emsp;&emsp;&emsp;-Repo '\<repository>' \
&emsp;&emsp;&emsp;-Author '\<commit author>' \
&emsp;&emsp;&emsp;-Date '\<date from>'
  
### Example: 
&emsp;.\GitHub.ps1 \
&emsp;&emsp;&emsp;-Login 'test' \
&emsp;&emsp;&emsp;-Token '***' \
&emsp;&emsp;&emsp;-Owner 'Microsoft' \
&emsp;&emsp;&emsp;-Repo 'CodeCamp' \
&emsp;&emsp;&emsp;-Author `'john.smith@gmail.com'` \
&emsp;&emsp;&emsp;-Date ([DateTime]::Today.AddDays(-1))
