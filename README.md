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

> Read in R file a chunk at a time; limit myself to 27 chunks of 100k rows (2.7M rows in total):

Props to @amunategui: https://amunategui.github.io/dealing-with-large-files/index.html

See [read-tsv_all.R](read-tsv_all.R)

Some benchmarking in R:
```
pryr::mem_change(rm(data))
```

```
rows,size
1000000,530MB
2000000,1.01GB
3000000,1.58GB
4000000,2.02GB
5000000,2.48GB
```

In general, we can state that every 1M rows equates to about 0.50 GB memory. Due to lack of that much system memory, I abandon and use data extracts from DC, MD, VA (DMV).