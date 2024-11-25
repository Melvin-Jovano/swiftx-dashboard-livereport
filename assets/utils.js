function displayUserNameAvatarText(username, firstName = null, lastName = null) {
    if(firstName != null && lastName != null) {
        return firstName?.[0].toUpperCase() + lastName?.[0].toUpperCase();
    }
    return username[0].toUpperCase();
}

function displayUserNameAvatarTextFromName(name) {
    const names = name.split(' ');
    if(names.length === 1) {
        return names[0][0].toUpperCase();
    } else {
        return names[0][0].toUpperCase() + names[1][0].toUpperCase();
    }
}

function displayUserName(username, firstName = null, lastName = null) {
    if(firstName != null && lastName != null) {
        return firstName + ' ' + lastName;
    }
    return username;
}

function formatRelativeTime(iso) {
    const now = new Date();
    const diff = Math.floor((now - new Date(iso)) / 1000); // Difference in seconds

    if (diff < 60) {
        return `${diff} seconds ago`;
    } else if (diff < 3600) {
        const minutes = Math.floor(diff / 60);
        return `${minutes} ${minutes === 1 ? 'min' : 'mins'} ago`;
    } else if (diff < 86400) {
        const hours = Math.floor(diff / 3600);
        return `${hours} ${hours === 1 ? 'hour' : 'hours'} ago`;
    } else if (diff < 2592000) {
        const days = Math.floor(diff / 86400);
        return `${days} ${days === 1 ? 'day' : 'days'} ago`;
    } else if (diff < 31536000) {
        const months = Math.floor(diff / 2592000);
        return `${months} ${months === 1 ? 'month' : 'months'} ago`;
    } else {
        const years = Math.floor(diff / 31536000);
        return `${years} ${years === 1 ? 'year' : 'years'} ago`;
    }
}

function truncateString(str, length = 10) {
    if (str.length > length) {
        return str.slice(0, length) + '...';
    }
    return str;
}

function nodeLink(nodeId) {
    return `/otcs/cs.exe/app/nodes/${nodeId}`;
}

function getLastPath(input, delimiter = ">") {
    const segments = input.split(delimiter);
    return segments[segments.length - 1].trim();
}

function generateRandomPastelColor() {
  const r = Math.floor(Math.random() * 100) + 100;
  const g = Math.floor(Math.random() * 100) + 100;
  const b = Math.floor(Math.random() * 100) + 100;
  return `rgb(${r}, ${g}, ${b})`;
}

function combineRGBToGradient(rgb1, rgb2, to = 'to bottom') {
    return `linear-gradient(${to}, ${rgb1}, ${rgb2})`;
}