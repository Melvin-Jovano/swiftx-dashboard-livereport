function displayUserNameAvatarText(username, firstName = null, lastName = null) {
    if(firstName != null && lastName != null) {
        return firstName?.[0] + lastName?.[0];
    }
    return username[0];
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