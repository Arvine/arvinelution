--Photon Prevent
function c511000303.initial_effect(c)
	--Negate Damage
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(511000303,0))
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_CHAINING)
	e1:SetCondition(c511000303.con)
	e1:SetOperation(c511000303.op)
	c:RegisterEffect(e1)
end
function c511000303.cfilter(c)
	return c:IsFaceup() and c:IsSetCard(0x55)
end
function c511000303.con(e,tp,eg,ep,ev,re,r,rp)
	return rp~=tp and Duel.IsExistingMatchingCard(c511000303.cfilter,e:GetHandler():GetControler(),LOCATION_MZONE,0,1,nil)
end
function c511000303.op(e,tp,eg,ep,ev,re,r,rp)
	local cid=Duel.GetChainInfo(ev,CHAININFO_CHAIN_ID)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CHANGE_DAMAGE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetTargetRange(1,0)
	e1:SetLabel(cid)
	e1:SetValue(c511000303.refcon)
	e1:SetReset(RESET_CHAIN)
	Duel.RegisterEffect(e1,tp)
end
function c511000303.refcon(e,re,val,r,rp,rc)
	local cc=Duel.GetCurrentChain()
	if cc==0 or bit.band(r,REASON_EFFECT)==0 then return end
	local cid=Duel.GetChainInfo(0,CHAININFO_CHAIN_ID)
	if cid==e:GetLabel() then return 0
	else return val end
end
