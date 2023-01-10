<script>
async function geocoding(url) {
	console.log(url);
    const res = await fetch(url,{
    	method: 'GET', // *GET, POST, PUT, DELETE 등
        mode: 'no-cors', // no-cors, *cors, same-origin
        headers: {
          'Content-Type': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded',
        },
    });
    
    console.log(res);
    const result = await res.json();
    console.log(result);
    return req.json();
}
async function doGeocoding(address) {
    const result = await geocoding("http://api.vworld.kr/req/address?service=address"
        + "&request=getcoord"
        + "&address=" + encodeURI(address) + "&type=road"
        + "&key=590F7AB9-0ECF-34B0-BC18-9C4D11C5C46B");
    console.log(result);
}
doGeocoding('광주 동구 예술길 33');
</script>