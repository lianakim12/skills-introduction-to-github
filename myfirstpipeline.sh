DATA=$(wget -qO- 'https://data.cityofnewyork.us/resource/erm2-nwe9.csv?$limit=50000&$order=created_date%20ASC' | csvgrep -c "complaint_type" -m "Street Condition" | csvgrep -c "descriptor" -m "Pothole" | csvcut -csvcut -c borough | tail -n +2 | sort | uniq -c)
cat > index.html <<EOP
<!doctype html>
<html>
<head>
    <title>NYC 311 Pothole Complaints</title>
</head>
<body>
    <h1>Pothole Complaints by Borough</h1>
    <pre>
$DATA
    </pre>
</body>
</html>
EOP