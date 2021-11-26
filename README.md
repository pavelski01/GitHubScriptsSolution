# GitHubScriptsSolution

- Usage: .\GitHub.ps1 \
      -Login '`<GitHub login>`' \
      -Token '`<GitHub token`>' \
      -Owner '`<owner`>' \
      -Repo '`<repository`>' \
      -Author '`<commit author`>' \
      -Date '`<date from`>' \
  
- Example: .\GitHub.ps1 \
      -Login 'test' \
      -Token '***' \
      -Owner 'Microsoft' \
      -Repo 'CodeCamp' \
      -Author 'john.smith@gmail.com' \
      -Date ([DateTime]::Today.AddDays(-1)) \
