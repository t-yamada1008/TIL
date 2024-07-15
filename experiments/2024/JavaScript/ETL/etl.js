document.getElementById("loadData").addEventListener("click", async () => {
    // step1: データを取得する
    const response = await fetch('https://randomuser.me/api/');
    const data = await response.json();

    // step2: データを表示する
    const user = data.results[0];
    const userInfo = {
        name: `${user.name.first} ${user.name.last}`,
        gender: user.gender,
        country: user.location.country,
        email: user.email,
        dateOfBirth: user.dob.date,
        picture: user.picture.large,
    };

    // step3: データの表示
    document.getElementById('userData').innerHTML = `
        <img src="${userInfo.picture}" />
        <div>
            <div>${userInfo.name}</div>
            <div>${userInfo.gender}</div>
            <div>${userInfo.country}</div>
            <div>${userInfo.email}</div>
            <div>${userInfo.dateOfBirth}</div>
        </div>
    `;
});
