const copyToClipboard = () => {
    const linkToCopy = document.querySelector('#LinkChallenge')
    linkToCopy.select();
    document.execCommand("copy");
}

export { copyToClipboard };
