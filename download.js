const windowsVersions = [
    {
        version: "",
        releaseDate: "",
        notes: "",
        fileUrl: "",
        fileSize: "",
        type: "",
        compatibility: ""
    }
];

function renderVersionList() {
    const container = document.getElementById('versions-list');

    windowsVersions.forEach((version, index) => {
        const versionCard = document.createElement('div');
        versionCard.className = 'version-card';

        versionCard.innerHTML = `
            <div class="version-header">
                <h3>Версия ${version.version}</h3>
                <span class="release-date">Выпущена: ${version.releaseDate}</span>
            </div>
            <p class="version-notes">${version.notes}</p>
            <div class="version-info">
                <span><i class="fas fa-hdd"></i> Размер: ${version.fileSize}</span>
                <span><i class="fas fa-tag"></i> ${version.type}</span>
                <span><i class="fas fa-desktop"></i> ${version.compatibility}</span>
            </div>
            <a
                href="${version.fileUrl}"
                class="btn download-btn"
                download
                target="_blank"
                onclick="trackDownload('${version.version}')"
            >
                <i class="fas fa-download"></i> Скачать для Windows
            </a>
        `;

        container.appendChild(versionCard);
    });
}

function trackDownload(version) {
    console.log(`Начато скачивание версии: ${version}`);
}

function initPage() {
    const versionsList = document.getElementById('versions-list');
    if (!versionsList) {
        console.error('Элемент versions-list не найден на странице');
        return;
    }

    renderVersionList();

    document.querySelectorAll('.download-btn').forEach(button => {
        button.addEventListener('click', function() {
            const version = this.getAttribute('onclick').match(/\'([^\']+)\'/)[1];
            trackDownload(version);
        });
    });

    window.scrollTo(0, 0);
}

document.addEventListener('DOMContentLoaded', initPage);

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { windowsVersions, renderVersionList, trackDownload };
}

