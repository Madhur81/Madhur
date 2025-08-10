<div class="main-page">
        <div class="main-content">
            <header class="main-Title-of-Page-messages">
                <div class="title-section">
                    <h1>Messages</h1>
                    <p class="page-description">Connect with instructors and get support from mentors.</p>
                </div>
            </header>

            <div class="messages-layout">
                <!-- Left Side - Conversations -->
                <div class="conversations-panel">
                    <h2 class="panel-title">Conversations</h2>
                    <div class="conversation-list">
                        <div class="conversation-item active">
                            <div class="user-avatar">
                                <img src="profile/kejriwal.png" alt="Dr. Sarah Chen">
                            </div>
                            <div class="conversation-content">
                                <div class="user-info">
                                    <h3 class="user-name">Mr.VINOD</h3>
                                    <span class="time">2 min ago</span>
                                </div>
                                <div class="user-role">Technical Analysis Instructor</div>
                                <p class="last-message">Great question about support levels!</p>
                            </div>
                            <div class="conversation-status">
                                <span class="message-status new"></span>
                            </div>
                        </div>

                        <div class="conversation-item">
                            <div class="user-avatar">
                                <img src="profile/salman.png" alt="Michael Rodriguez">
                            </div>
                            <div class="conversation-content">
                                <div class="user-info">
                                    <h3 class="user-name">Tushar choudary</h3>
                                    <span class="time">1 hour ago</span>
                                </div>
                                <div class="user-role">Options Trading Mentor</div>
                                <p class="last-message">The covered call strategy looks good</p>
                            </div>
                        </div>

                        <div class="conversation-item">
                            <div class="user-avatar">
                                <img src="profile/rahul.png" alt="TradeX Support">
                            </div>
                            <div class="conversation-content">
                                <div class="user-info">
                                    <h3 class="user-name">TradeX Mane</h3>
                                    <span class="time">3 hours ago</span>
                                </div>
                                <div class="user-role">Support Team</div>
                                <p class="last-message">Your account has been updated</p>
                            </div>
                            <div class="conversation-status">
                                <span class="message-status unread">1</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side - Chat Window -->
                <div class="chat-panel">
                    <div class="chat-header">
                        <div class="chat-user-info">
                            <div class="user-avatar large">
                                <img src="profile/kejriwal.png" alt="Dr. Sarah Chen">
                            </div>
                            <div class="user-details">
                                <h2 class="user-name">Mr.VINOD</h2>
                                <div class="user-subtitle">Technical Analysis Instructor</div>
                            </div>
                        </div>
                        <div class="chat-actions">
                            <button class="action-button" aria-label="Voice Call">
                                <i class="fas fa-phone"></i>
                            </button>
                            <button class="action-button" aria-label="Video Call">
                                <i class="fas fa-video"></i>
                            </button>
                            <button class="action-button" aria-label="More Options">
                                <i class="fas fa-ellipsis-v"></i>
                            </button>
                        </div>
                    </div>

                    <div class="chat-messages">
                        <div class="message-group">
                            <div class="message incoming">
                                <p>Hi Alex! I saw your question about identifying support and resistance levels. Let me help you with that.</p>
                                <span class="message-time">10:35 AM</span>
                            </div>
                        </div>

                        <div class="message-group">
                            <div class="message outgoing">
                                <p>Thank you! I'm having trouble distinguishing between strong and weak support levels on the charts.</p>
                                <span class="message-time">10:36 AM</span>
                            </div>
                        </div>

                        <div class="message-group">
                            <div class="message incoming">
                                <p>Great question! Strong support levels typically have multiple touches, high volume, and psychological significance. For example, round numbers like $100, $200 often act as strong support.</p>
                                <span class="message-time">10:38 AM</span>
                            </div>
                        </div>

                        <div class="message-group">
                            <div class="message outgoing">
                                <p>That makes sense. Should I also look at historical price action at those levels?</p>
                                <span class="message-time">10:37 AM</span>
                            </div>
                        </div>

                        <div class="message-group">
                            <div class="message incoming">
                                <p>Absolutely! Historical price action is crucial. If price has bounced from a level multiple times in the past, it's more likely to hold again. Also look for volume spikes at those levels.</p>
                                <span class="message-time">10:40 AM</span>
                            </div>
                        </div>
                    </div>

                    <div class="chat-input">
                        <div class="input-wrapper">
                            <input type="text" id="messageInput" placeholder="Type your message...">
                            <button class="send-button" id="sendMessageBtn">
                                <i class="fas fa-paper-plane"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
document.addEventListener('DOMContentLoaded', function(){
  const messageInput = document.getElementById('messageInput');
  const sendButton = document.getElementById('sendMessageBtn');
  const chatMessages = document.querySelector('.chat-messages');
  const conversationItems = document.querySelectorAll('.conversation-item');
  if (!messageInput || !sendButton || !chatMessages) return;

  const conversations = {
    'Mr.VINOD': {
      messages: [
        {type:'incoming', text:'Hi Alex! I saw your question about identifying support and resistance levels. Let me help you with that.', time:'10:35 AM'},
        {type:'outgoing', text:"Thank you! I'm having trouble distinguishing between strong and weak support levels on the charts.", time:'10:36 AM'},
        {type:'incoming', text:'Great question! Strong support levels typically have multiple touches, high volume, and psychological significance. For example, round numbers like $100, $200 often act as strong support.', time:'10:38 AM'},
        {type:'outgoing', text:"That makes sense. Should I also look at historical price action at those levels?", time:'10:37 AM'},
        {type:'incoming', text:"Absolutely! Historical price action is crucial. If price has bounced from a level multiple times in the past, it's more likely to hold again. Also look for volume spikes at those levels.", time:'10:40 AM'}
      ],
      avatar:'profile/kejriwal.png',
      role:'Technical Analysis Instructor'
    },
    'Tushar choudary': {
      messages:[
        {type:'incoming', text:"Hello! I noticed you're working on options strategies.", time:'9:15 AM'},
        {type:'outgoing', text:"Yes, I'm trying to understand covered calls better.", time:'9:20 AM'},
        {type:'incoming', text:'Great choice for beginners. A covered call involves holding the stock and selling a call option.', time:'9:25 AM'},
        {type:'outgoing', text:"I've drafted a strategy. Can you take a look?", time:'9:45 AM'},
        {type:'incoming', text:'The covered call strategy looks good', time:'10:00 AM'}
      ],
      avatar:'profile/rahul.png',
      role:'Options Trading Mentor'
    },
    'TradeX Mane': {
      messages:[
        {type:'incoming', text:'Hello! Welcome to TradeX. How can we assist you today?', time:'8:00 AM'},
        {type:'outgoing', text:'Hi, I need to update my account information.', time:'8:15 AM'},
        {type:'incoming', text:'Of course! I can help you with that. What information would you like to update?', time:'8:20 AM'},
        {type:'outgoing', text:'I need to change my email address.', time:'8:25 AM'},
        {type:'incoming', text:'Your account has been updated', time:'9:00 AM'}
      ],
      avatar:'profile/salman.png',
      role:'Support Team'
    }
  };

  function nowString(){
    const n=new Date();
    let h=n.getHours(), m=n.getMinutes(), ampm=h>=12?'PM':'AM';
    h=h%12||12; m = m<10? '0'+m : m;
    return h+':'+m+' '+ampm;
  }

  function escapeHtml(s){
    return String(s).replace(/</g,'&lt;').replace(/>/g,'&gt;');
  }

  function sendMessage(){
    const text = messageInput.value.trim();
    if (!text) return;
    const time = nowString();
    const html = '<div class="message-group"><div class="message outgoing"><p>' + escapeHtml(text) + '</p><span class="message-time">' + time + '</span></div></div>';
    chatMessages.insertAdjacentHTML('beforeend', html);

    const currentUserNameEl = document.querySelector('.chat-header .user-name');
    const currentUserName = currentUserNameEl ? currentUserNameEl.textContent : null;
    if (currentUserName && conversations[currentUserName]) {
      conversations[currentUserName].messages.push({type:'outgoing', text: text, time: time});
      const activeConversation = document.querySelector('.conversation-item.active');
      if (activeConversation) {
        const lastMessageElement = activeConversation.querySelector('.last-message');
        if (lastMessageElement) lastMessageElement.textContent = text;
        const timeElement = activeConversation.querySelector('.time');
        if (timeElement) timeElement.textContent = 'Just now';
      }
    }

    messageInput.value = '';
    chatMessages.scrollTop = chatMessages.scrollHeight;

    setTimeout(()=> simulateResponse(currentUserName), Math.random()*1000 + 1000);
  }

  function simulateResponse(userName){
    const pool = {
      'Mr.VINOD': ['That\'s a great observation! Keep practicing with real charts.', 'You might also want to look at moving averages as dynamic support/resistance.', 'Don\'t forget that support becomes resistance once broken, and vice versa.', 'Consider using multiple timeframes to confirm your levels.', 'Volume analysis is key - high volume at support/resistance makes them stronger.'],
      'Tushar choudary': ['Remember to consider implied volatility when selling covered calls.', 'You might want to aim for strikes with 30-45 days to expiration for optimal theta decay.', 'Consider rolling your covered calls if the stock approaches your strike price.', 'Always have an exit strategy before entering any options trade.', 'Paper trade first to get comfortable with the strategy.'],
      'TradeX Mane': ['Is there anything else you need help with today?', 'Your account security is our priority. Consider enabling two-factor authentication.', 'We\'ve sent a confirmation email to your new address.', 'Our support team is available 24/7 to assist you.', 'Don\'t hesitate to reach out if you have any other questions.']
    };
    if (!pool[userName]) return;
    const resp = pool[userName][Math.floor(Math.random()*pool[userName].length)];
    const time = nowString();
    const html = '<div class="message-group"><div class="message incoming"><p>' + escapeHtml(resp) + '</p><span class="message-time">' + time + '</span></div></div>';
    chatMessages.insertAdjacentHTML('beforeend', html);

    if (conversations[userName]) {
      conversations[userName].messages.push({type:'incoming', text: resp, time: time});
      const activeConversation = document.querySelector('.conversation-item.active');
      if (activeConversation) {
        const lastMessageElement = activeConversation.querySelector('.last-message');
        if (lastMessageElement) lastMessageElement.textContent = resp;
        const timeElement = activeConversation.querySelector('.time');
        if (timeElement) timeElement.textContent = 'Just now';
      }
    }
    chatMessages.scrollTop = chatMessages.scrollHeight;
  }

  function loadConversation(userName){
    if (!conversations[userName]) return;
    chatMessages.innerHTML = '';
    conversations[userName].messages.forEach(m=>{
      const html = '<div class="message-group"><div class="message ' + m.type + '"><p>' + escapeHtml(m.text) + '</p><span class="message-time">' + m.time + '</span></div></div>';
      chatMessages.insertAdjacentHTML('beforeend', html);
    });
    chatMessages.scrollTop = chatMessages.scrollHeight;
    const nameEl = document.querySelector('.chat-header .user-name');
    const subtitleEl = document.querySelector('.chat-header .user-subtitle');
    const avatarEl = document.querySelector('.chat-header .user-avatar img');
    if (nameEl) nameEl.textContent = userName;
    if (subtitleEl) subtitleEl.textContent = conversations[userName].role;
    if (avatarEl) avatarEl.src = conversations[userName].avatar;
  }

  sendButton.addEventListener('click', function(e){ e.preventDefault(); sendMessage(); });
  messageInput.addEventListener('keypress', function(e){ if (e.key === 'Enter') { e.preventDefault(); sendMessage(); } });

  conversationItems.forEach(item => {
    item.addEventListener('click', function(){
      conversationItems.forEach(i => i.classList.remove('active'));
      this.classList.add('active');
      const userName = this.querySelector('.user-name').textContent;
      loadConversation(userName);
      const unread = this.querySelector('.message-status.unread');
      if (unread) unread.remove();
    });
  });

  document.querySelectorAll('.action-button').forEach(button=>{
    button.addEventListener('click', function(e){
      e.preventDefault();
      const icon = this.querySelector('i');
      const ic = icon ? icon.className : '';
      if (ic.includes('fa-phone') || ic.includes('fa-video')) {
        const note = document.createElement('div');
        note.style.cssText = 'position:fixed;top:20px;right:20px;background:var(--primary-green);color:#fff;padding:1rem 1.5rem;border-radius:12px;z-index:1000;font-weight:500;display:flex;align-items:center;gap:0.5rem';
        
        const iconEl = document.createElement('i');
        iconEl.className = ic.includes('fa-phone') ? 'fas fa-phone' : 'fas fa-video';
        
        const textNode = document.createTextNode(ic.includes('fa-phone') ? ' Initiating voice call...' : ' Starting video call...');
        
        note.appendChild(iconEl);
        note.appendChild(textNode);
        
        document.body.appendChild(note);
        setTimeout(()=>note.remove(),3000);
      } else if (ic.includes('fa-ellipsis')) {
        // dropdown
        const existing = this.querySelector('.options-dropdown');
        if (existing) { existing.remove(); return; }
        const dd = document.createElement('div');
        dd.className='options-dropdown';
        dd.style.cssText='position:absolute;top:100%;right:0;background:#fff;border:1px solid var(--border-color);border-radius:12px;box-shadow:0 8px 32px rgba(0,0,0,0.1);z-index:1000;min-width:180px;margin-top:8px';
        
        const opts = [
          {icon:'fas fa-user',text:'View Profile'},
          {icon:'fas fa-bell-slash',text:'Mute Notifications'},
          {icon:'fas fa-folder',text:'Shared Files'},
          {icon:'fas fa-ban',text:'Block User'}
        ];
        
        opts.forEach(o=>{
          const it=document.createElement('div');
          it.style.cssText='padding:0.75rem 1rem;cursor:pointer;display:flex;align-items:center;gap:0.75rem;font-size:0.9rem';
          
          const iconEl = document.createElement('i');
          iconEl.className = o.icon;
          iconEl.style.width = '16px';
          
          const textEl = document.createElement('span');
          textEl.textContent = o.text;
          
          it.appendChild(iconEl);
          it.appendChild(textEl);
          
          it.addEventListener('click', ()=>alert(o.text + ' clicked'));
          it.addEventListener('mouseenter', ()=> it.style.background='var(--bg-light)');
          it.addEventListener('mouseleave', ()=> it.style.background='transparent');
          dd.appendChild(it);
        });
        
        this.style.position='relative';
        this.appendChild(dd);
        setTimeout(()=> {
          document.addEventListener('click', function close(e){
            if (!dd.contains(e.target)) { dd.remove(); document.removeEventListener('click', close); }
          });
        },100);
      }
    });
  });

  let typingTimeout;
  messageInput.addEventListener('input', function(){
    clearTimeout(typingTimeout);
    typingTimeout = setTimeout(()=>{/* hide typing */}, 1000);
  });

  const observer = new MutationObserver(function(muts){
    muts.forEach(m=> { if (m.type === 'childList' && m.addedNodes.length) {
        chatMessages.scrollTo({top: chatMessages.scrollHeight, behavior: 'smooth'});
    }});
  });
  observer.observe(chatMessages, {childList:true});
});
</script>