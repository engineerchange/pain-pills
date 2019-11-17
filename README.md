# pain-pills

## Import Data

Data Source: https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources

> Use PowerShell to perform quick check on number of rows for reading pain-pills into R without keeping it all in memory:

```
$count = 0
$filepath = Resolve-Path ".\arcos_all_washpost.tsv.gz" #get long filepath within current wd
$reader = New-Object IO.StreamReader $filepath
while($reader.ReadLine() -ne $null){$count++} #readline row at a time
$count #print row number
$reader.Close()
```
**52,567,689 rows**

---

> Read in R file a chunk at a time; limit myself to 27 chunks (2.7M rows):

Props to @amunategui: https://amunategui.github.io/dealing-with-large-files/index.html

See [read-tsv.R](read-tsv.R)